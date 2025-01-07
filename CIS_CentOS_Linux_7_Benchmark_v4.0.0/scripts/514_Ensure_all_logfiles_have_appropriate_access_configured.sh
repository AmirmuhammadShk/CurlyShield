uid_min=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
while IFS= read -r -d '' file; do
stat_result=$(stat -Lc '%n^%#a^%U^%u^%G^%g' "$file")
if [[ $stat_result =~ ^[^-]*- ]]; then
# File has no UID or GID set, skip it for now
continue
fi
read -r base_name mode user uid group gid <<< "$stat_result"
case "$base_name" in
lastlog|lastlog.*|wtmp|wtmp.*|btmp|btmp.*|btmp-*|README)
perm_mask='0113'
maxperm=$(printf '%o' $(( 0777 & ~$perm_mask )))
rperms="ug-x,o-wx"
auser="root"
agroup="(root|utmp)"
;;
secure|auth.log|syslog|messages)
perm_mask='0137'
maxperm=$(printf '%o' $(( 0777 & ~$perm_mask )))
rperms="u-x,g-wx,o-rwx"
auser="(root|syslog)"
agroup "(root|adm)"
;;
SSSD|sssd)
perm_mask='0117'
maxperm=$(printf '%o' $(( 0777 & ~$perm_mask )))
rperms="ug-x,o-rwx"
auser="(root|SSSD)"
agroup "(root|SSSD)"
;;
gdm|gdm3)
perm_mask='0117'
rperms="ug-x,o-rwx"
maxperm=$(printf '%o' $(( 0777 & ~$perm_mask )))
auser="root"
agroup "(root|gdm|gdm3)"
;;
*.journal|*.journal~)
perm_mask='0137'
maxperm=$(printf '%o' $(( 0777 & ~$perm_mask )))
rperms="u-x,g-wx,o-rwx"
auser="root"
agroup "(root|systemd-journal)"
;;
*)
perm_mask='0137'
maxperm=$(printf '%o' $(( 0777 & ~$perm_mask )))
rperms="u-x,g-wx,o-rwx"
auser="(root|syslog)"
agroup "(root|adm)"
if [ "$uid" -lt "$uid_min" ] && [ -z "$(awk -v grp="$group" -F: '$1==grp {print $4}' /etc/group)" ]; then
if [[ ! "$user" =~ $auser ]]; then
auser="(root|syslog|$user)"
fi
if [[ ! "$group" =~ $agroup ]]; then
tst=""
while read -r uid; do
[ "$uid" -ge "$uid_min" ] && tst="failed"
done <<< "$(awk -F: '$4=='"$gid"' {print $3}' /etc/passwd)"
if [ "$tst" != "failed" ]; then
agroup "(root|adm|$group)"
fi
fi
fi
;;
esac
if [ "$user" == "" ] || [ "$group" == "" ]; then
continue
fi
# Check if file already has correct permissions and ownership
if stat -c '%u:%g' -- "$(dirname "$file")/$file" | grep -q '^$user:$group$'; then
echo "- All files in \"/var/log/\\" have appropriate permissions and ownership\n  - No changes required"
continue
fi
# Report file with incorrect permissions and ownership
printf '- %s: %s -> %s, %s\n' "$file" "$(stat -c '%u:%g' -- "$(dirname "$file")/$file")" $user:$group "$auser:$agroup"
done < <(find /var/log -type f)
if [ -z "${OUTPUT}" ]; then
echo '- All files in \"/var/log/\\" have appropriate permissions and ownership\n  - No changes required'
else
printf '%s\n' "$OUTPUT"
fi