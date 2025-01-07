l_ssh_group_name=$(awk -F: '($1 ~ /^(ssh_keys|_?ssh)$/) {print $1}' /etc/group)
f_file_access_fix() {
while IFS=: read -r l_file_mode l_file_owner l_file_group; do
echo "File: \"$l_file\" mode: \"$l_file_mode\" owner \"$l_file_owner\" group \"$l_file_group\""
if [ "$l_file_group" = "$l_ssh_group_name" ]; then
chmod u-x,g-wx,o-rwx "$l_file"
else
chmod u-x,go-rwx "$l_file"
fi
if [ "$l_file_owner" != "root" ]; then
chown root "$l_file"
fi
if [[ ! "$l_file_group" =~ ($l_ssh_group_name|root) ]]; then
if [ -n "$l_ssh_group_name" ]; then
l_new_group="$l_ssh_group_name"
else
l_new_group="root"
fi
chgrp "$l_new_group" "$l_file"
fi
done < <(stat -Lc '%#a:%U:%G' "$l_file")
}
find /etc/ssh -xdev -type f -print0 | while IFS= read -r l_file; do
if ssh-keygen -lf &>/dev/null "$l_file"; then
file "$l_file" | grep -Piq -- '\bopenssh\h+([^#\n\r]+\h+)?private\h+key\b' && f_file_access_fix
fi
done
if [ -z "$l_output2" ]; then
echo -e "\n- No access changes required\n"
else
echo -e "\n- Remediation results:\n$l_output2\n"
fi