set_ssh_key_permissions() {
while IFS=: read -r file_mode file_owner file_group; do
max_perm=$(printf '%o' $(( 0777 & ~$file_mode )))
output=""
if [ $file_mode -gt $max_perm ]; then
output+="  - Mode: \"$file_mode\" should be mode: \"$max_perm\" or more restrictive\n"
chmod u-x,go-wx
fi
if [ "$file_owner" != "root" ]; then
output+="  - Owned by: \"$file_owner\" should be owned by \"root\"\n"
chown root "$file"
fi
if [ "$file_group" != "root" ]; then
output+="  - Owned by group \"$file_group\" should be group owned by: \"root\"\n"
chgrp root "$file"
fi
if [ -z "$output" ]; then
output+="  - Correct: mode: \"$file_mode\", owner: \"$file_owner\", and group owner: \"$file_group\" configured"
fi
done < <(stat -Lc '%#a:%U:%G' "/etc/ssh/")
if [ "$output" != "" ]; then
echo -e "\n- Remediation results:\n$output"
else
echo -e "\n- No access changes required\n"
fi
}
set_ssh_key_permissions
default_permissions="644 root root"
set_ssh_key_permissions "$default_permissions"