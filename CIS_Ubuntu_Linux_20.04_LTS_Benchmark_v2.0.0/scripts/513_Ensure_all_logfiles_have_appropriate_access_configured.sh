uid_min=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
for file in $(find -L /var/log -type f \( -perm /0137 -o ! -user root -o ! -group root \) -print0); do
stat_result=$(stat -Lc '%n^%#a^%U^%u^%G^%g' "$file")
file_name=$(basename "$file")
# Determine permission mask and maximum allowed permissions
if [ "$file_name" = "lastlog*" ] || [ "$file_name" = "wtmp*" ] || [ "$file_name" = "btmp*" ]; then
permission_mask='0113'
max_allowed_permissions=$(printf '%o' $(( 0777 & ~$permission_mask)))
elif [ "$file_name" = "secure" ] || [ "$file_name" = "auth.log" ] || [ "$file_name" = "messages" ]; then
permission_mask='0137'
max_allowed_permissions=$(printf '%o' $(( 0777 & ~$permission_mask)))
elif [ "$file_name" = "SSSD*" ] || [ "$file_name" = "sssd" ]; then
permission_mask='0117'
max_allowed_permissions=$(printf '%o' $(( 0777 & ~$permission_mask)))
elif [ "$file_name" = "gdm*" ] || [ "$file_name" = "gdm3" ]; then
permission_mask='0117'
max_allowed_permissions=$(printf '%o' $(( 0777 & ~$permission_mask)))
else
permission_mask='0137'
max_allowed_permissions=$(printf '%o' $(( 0777 & ~$permission_mask)))
fi
# Determine read, write, and execute permissions for owner, group, and others
owner_permissions="u-x,g-wx,o-rwx"
if [ "$file_name" = "gdm*" ] || [ "$file_name" = "gdm3" ]; then
owner_permissions="u-x,o-rwx,g-wx,o-rwx"
fi
# Check if file exists in /etc/passwd and group exists in /etc/group
group_exists=$(awk -F: '$4=='"$file"' {print $3}' /etc/passwd)
if [ "$group_exists" != "" ]; then
group_permissions=$(awk -v grp="$file" -F: '$1==grp {print $4}' /etc/group)
if [ "$group_permissions" != "*" ]; then
owner_permissions="u-x,g-${group_permissions:-},o-rwx"
fi
else
owner_permissions=${owner_permissions//g-wx/o-rwx}
fi
# Check if UID is less than minimum UID and user or group does not exist
if [ "$file_name" = "${a_file[@]}" ]; then
if [ $(echo "$stat_result" | cut -d^ -f4) -lt $uid_min ] && [ ! -n "$(awk -v grp="$group_exists" -F: '$1==grp {print $3}' /etc/group)" ]; then
if [ ! "$user_permissions" = "u-x,g-wx,o-rwx" ]; then
user_permissions="root,syslog,$file_name"
fi
if [ ! "$group_permissions" = "g-wx,o-rwx" ]; then
group_permissions="$file_exists,$group_exists"
fi
fi
fi
# Test file permissions and print report if necessary
permission_test_result=0
for test in read $owner_permissions write $group_permissions execute $user_permissions; do
if [ "$(echo "$stat_result" | cut -d^ -f$((test+3)))" != "x" ]; then
((permission_test_result++))
fi
done
permission_test_result=$((permission_test_result > 0 ? permission_test_result : 1))
if [ $permission_test_result -eq 1 ] || [ $permission_test_result -eq 2 ]; then
echo -e "\n$l_file has inappropriate permissions and ownership.
- Permission test: $((permission_test_result)) errors.
- Recommended changes:
- $user_permissions
- $group_permissions
- File: $file_name
"
fi
done
if [ $(echo "${a_file[@]}" | wc -l) -eq 0 ]; then
echo -e "- All files in \"/var/log/\" have appropriate permissions and ownership\n  - No changes required"
else
# print report of changes
for file in $(find -L /var/log -type f \( -perm /0137 -o ! -user root -o ! -group root \) -print0); do
echo -e "\n$l_file has inappropriate permissions and ownership.
- Permission test: $((1+permission_test_result)) errors.
- Recommended changes:
- u-x,g-wx,o-rwx
- File: $file_name"
done
fi