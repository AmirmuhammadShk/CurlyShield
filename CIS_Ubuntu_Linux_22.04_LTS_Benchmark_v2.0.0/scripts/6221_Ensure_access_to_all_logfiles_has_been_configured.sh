update_permissions_and_ownership() {
# Find all log files in /var/log that match the specified patterns and have incorrect permissions
while IFS= read -r l_file; do
if [ -e "$l_file" ]; then
mode=$(stat -c '%a' "$l_file")
uid_min=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
user=$(basename "$l_file")
group=$(basename -s ".log" "$user")
if [ $((mode & 0o700)) -gt 0 ]; then
echo "File: $user.log is:$mode (should be $uid_min or more restrictive)"
chmod 755 "$l_file"
fi
if [[ ! "${UID_MIN##*:}" =~ ${uid} ]]; then
echo "Owned by: $user and should be owned by ${UID_MIN##*:}"
chown root "$l_file"
fi
if [[ ! "${GROUP_MIN##*:}" =~ $group ]]; then
echo "Group owned by: $group and should be group owned by ${GROUP_MIN##*:}"
chgrp root "$l_file"
fi
# If no changes were made, report that all files have appropriate permissions and ownership
if [ -z "$errors" ]; then
echo "- All files in \"/var/log/\" have appropriate permissions and ownership\n  - No changes required\n"
else
# Print the report of changes
echo "\n$errors"
fi
fi
done < <(find /var/log -type f \( -perm 0700 -o ! -user root -o ! -group root \) -print0)
update_permissions_and_ownership