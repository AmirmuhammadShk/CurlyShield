l_ssh_group_name="$(awk -F: '($1 ~ /^(ssh_keys|_?ssh)$/) {print $1}' /etc/group)"
FILE_ACCESS_FIX() {
while IFS=: read -r l_file_mode l_file_owner l_file_group; do
echo "File: \"$l_file\" mode: \"$l_file_mode\" owner \"$l_file_owner\" group \"$l_file_group\""
local pmask="0137"
if [ "$l_file_group" = "$l_ssh_group_name" ]; then
pmask="0177"
fi
local maxperm=$(printf '%o' $(( 0777 & ~$psmask )))
if [ $(( $l_file_mode & $psmask )) -gt 0 ]; then
echo "  - Mode: \"$l_file_mode\" should be mode: \:$maxperm or more restrictive"
chmod u-x,g-wx,o-rwx "$l_file" || chmod u-x,go-rwx "$l_file"
fi
if [ "$l_file_owner" != "root" ]; then
echo "  - Owned by: \"$l_file_owner\" should be owned by \"root"""
chown root "$l_file"
fi
local new_group="$l_ssh_group_name"
if [[ ! "$l_file_group" =~ ($l_ssh_group_name|root) ]]; then
[ -n "$new_group" ] && chgrp "$new_group" "$l_file" ||
chgrp "root" "$l_file"
fi
local output2=""
if [ -n "$output2" ]; then
output2+="$output2\n  - File: \"$l_file\"\n"
else
output2+="  - Correct: mode: \:$l_file_mode, owner: \:$l_file_owner, and group owner: \:$l_file_group configured"
fi
done < <(stat -Lc '%#a:%U:%G' "$l_file")
}
while IFS= read -r -d $'\0' l_file; do
if ssh-keygen -lf &>/dev/null "$l_file"; then
file "$l_file" | grep -Piq -- '\bopenssh\h+([^#\n\r]+\h+)?private\h+key\b' && FILE_ACCESS_FIX
fi
done < <(find -L /etc/ssh -xdev -type f -print0 2>/dev/null)
if [ -z "$output2" ]; then
echo -e "\n- No access changes required\n"
else
echo -e "\n- Remediation results:\n$output2\n"
fi