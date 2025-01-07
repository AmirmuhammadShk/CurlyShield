DEFAULT_VALUES="644 0/root 0/root"
while IFS= read -r l_file; do
if ssh-keygen -lf &>/dev/null "$l_file"; then
file "$l_file" | grep -Piq -- '\bopenssh\h+([^#\n\r]+\h+)?public\h+key\b' && FILE_ACCESS_FIX
fi
done < <(find -L /etc/ssh -xdev -type f -print0 2>/dev/null)
FILE_ACCESS_FIX() {
while IFS=: read -r l_file_mode l_file_owner l_file_group; do
local output
output=""
if [ $(( $l_file_mode & $l_pmask )) -gt 0 ]; then
output+="- Mode: \"$l_file_mode\" should be mode: $l_maxperm or more restrictive\n"
chmod u-x,go-wx
fi
if [ "$l_file_owner" != "root" ]; then
output+="- Owned by: \"$l_file_owner\" should be owned by \"root\"\n"
chown root "$l_file"
fi
if [ "$l_file_group" != "root" ]; then
output+="- Owned by group \"$l_file_group\" should be group owned by: \"root\"\n"
chgrp root "$l_file"
fi
if [ -n "$output" ]; then
echo -e "- File: $l_file"$output
else
echo -e "- File: $l_file\n  - Correct: mode: $l_file_mode, owner: $l_file_owner, and group owner: $l_file_group configured"
fi
done < <(stat -Lc '%#a:%U:%G' "$l_file")
}
DEFAULT_PMASK="0133"
MAX_PERM=$(printf '%o' $(( 0777 & ~$DEFAULT_PMASK)))
while IFS= read -r l_file; do
FILE_ACCESS_FIX
done