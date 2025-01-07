audit_uids() {
# Get all UIDs
uids=$(getent passwd | cut -d: -f1)
# Remove duplicates
unique_uids=($(echo "$uids" | tr ' ' '\n' | sort -u))
# Review files owned by shared UIDs
for uid in "${unique_uids[@]}"; do
echo "Reviewing UID $uid"
files=$(find / -type f -uid $uid)
if [ -n "$files" ]; then
echo "Files owned by UID $uid:"
echo "$files"
fi
done
}
audit_uids