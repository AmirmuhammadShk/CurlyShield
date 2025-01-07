for uid in $(getent group | cut -d: -f3); do
if ! getent passwd | grep -q "^$uid:"; then
new_uid=$((1000 + ${#group_names[@]}))
useradd -u $new_uid <(echo "uid=1 gid=1 $uid")
echo "$new_uid" > /etc/passwd
fi
done
for file in $(find / -type f); do
uid=$(stat -c '%U' "$file")
if [ -n "$uid" ]; then
group=$(stat -c '%G' "$file")
if [ $uid -ne ${group#*:} ]; then
echo "File $file is owned by UID $uid but in group ${group#*:}" >&2
fi
fi
done