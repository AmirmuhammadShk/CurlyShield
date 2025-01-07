uid_min=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
while IFS= read -r -d $'\0' file; do
if [ -e "$file" ]; then
uid=$(stat -Lc '%u' "$file")
gid=$(stat -Lc '%g' "$file")
case $(basename "$file") in
lastlog|lastlog.*|wtmp|wtmp.*|wtmp-*|btmp|btmp.*|btmp-*|README)
chmod u-x,g-wx,o-rwx "$file"
;;
secure|auth.log|syslog|messages)
chmod u-x,g-wx,o-rwx "$file"
;;
SSSD|sssd)
chmod u-x,o-rwx "$file"
;;
gdm|gdm3)
chmod u-x,o-rwx "$file"
;;
*.journal|*.journal~)
chmod u-x,g-wx,o-rwx "$file"
;;
*)
if [ $uid -lt $uid_min ]; then
uid=$((uid + 1))
fi
if ! grep -q "^$uid:" /etc/passwd; then
new_gid=$(awk -v grp="$gid" -F: '$1==grp {print $4}' /etc/group | cut -d: -f3)
if [ "$new_gid" != "$(id -g)" ]; then
new_gid=$(( (uid + 100) % 1000 ))
fi
chown root:$new_gid "$file"
fi
chmod u-x,g-wx,o-rwx "$file"
;;
esac
fi
done < <(find /var/log -type f -perm 0137 ! -user root -o ! -group root -print0)
if [ -z "$output" ]; then
echo "- All files in \"/var/log/\" have appropriate permissions and ownership"
echo "- No changes required"
else
echo "\n$output"
fi