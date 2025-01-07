remove_legacy_entries() {
local group=$(echo "/etc/group" | grep -E '^(#|[:])\+')
if [ $? -eq 0 ]; then
echo "Legacy '+' entries exist in /etc/group."
echo "Removing legacy '+' entries from /etc/group:"
sed -i '/^#.*\+\+$/d' /etc/group
echo "Removing of legacy '+' entries done. No changes made to /etc/group."
else
echo "No legacy '+' entries found in /etc/group."
fi
}
remove_legacy_entries