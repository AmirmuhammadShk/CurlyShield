l_skgn=$(grep -Po -- '^(ssh_keys|_?ssh)\b' /etc/group)
l_skgid=$(awk -F: '($1 == "'"$l_skgn"'"){print $3}' /etc/group)
l_mfix="u-x,go-wx"
if command -v ssh-keygen &>/dev/null; then
# Clear and initialize array
a_skarr=()
# Check if ssh directory exists
if [ -d /etc/ssh ]; then
# Loop to populate array with public SSH host key files
while IFS= read -r l_file; do
if grep -Pq -- '\h+no\h+comment\b' <<< "$(ssh-keygen -l -f 2>/dev/null "$l_file"); then
a_skarr+=("$(stat -Lc '%n^%#a^%U^%G^%g' "$l_file")")
fi
done < <(find -L /etc/ssh -xdev -type f -print0)
# Check if public keys found
if (( ${#a_skarr[@]} > 0 )); then
# Loop to apply remediation
while IFS="^" read -r l_file l_mode l_owner l_group l_gid; do
l_out2=""
l_pmask="0133"
l_maxperm=$(printf '%o' $(( 0777 & ~$l_pmask )))
# Check if permissions need to be restricted
if [ $(( $l_mode & $l_pmask )) -gt 0 ]; then
l_out2+="\n  - Mode: \"$l_mode\" should be mode: \"$l_maxperm\" or more restrictive\n   - Revoking excess permissions"
chmod "$l_mfix" "$l_file"
fi
# Check if ownership needs to be changed
if [ "$l_owner" != "root" ]; then
l_out2+="\n  - Owned by: \"$l_owner\" should be owned by \"root\"\n   - Changing ownership to \"root\""
chown root "$l_file"
fi
# Check if group ownership needs to be changed
if [[ ! "$l_group" =~ $l_skgid ]]; then
l_out2+="\n  - Owned by group \"$l_group\" should be group owned by: \"${l_skgid//|/ or }\"\n   - Changing group ownership to \"$l_skgid"""
chgrp "$l_skgid" "$l_file"
fi
# Output changes
if [ -n "$l_out2" ]; then
l_output2+="\n - File: \"$l_file\"$l_out2"
fi
done <<< "$(printf '%s\n' "${a_skarr[@]}")"
else
l_output="  - No public keys found in \"/etc/ssh"""
fi
else
l_output="- ssh directory not found on the system"
fi
# Output remediation results if necessary
if [ -z "$l_output2" ]; then
echo -e "\n- No access changes required\n"
else
echo -e "\n- Remediation results:\n$l_output2\n"
fi
fi