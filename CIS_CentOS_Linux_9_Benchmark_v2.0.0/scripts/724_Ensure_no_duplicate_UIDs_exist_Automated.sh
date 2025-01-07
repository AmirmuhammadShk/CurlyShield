audit_uids() {
# Get all UIDs from audit script
uids=$(audit --uids)
# Check for duplicates and create unique UIDs if necessary
unique_uids=($(echo "$uids" | tr '\n' ' ' | sort -u))
if [ ${#unique_uids[@]} -gt $(grep -c '^uid:' /etc/passwd) ]; then
echo "Duplicate UIDs found, reassigning UIDs"
for i in "${!unique_uids[@]}"; do
uid=${unique_uids[i]}
new_uid=$((i+1))
# Update UID in password database
sed -i "/uid:$uid/s/uid:$uid/new_uid:$(awk -v n=$new_uid '$1==n{print $0}' /etc/passwd)/" /etc/passwd
done
fi
# Review all files owned by the shared UIDs to determine which UID they are supposed to belong to
for file in $(find / -type f -print); do
uid=$(stat -c "%u" "$file")
if [ $uid -ne 0 ]; then
echo "File $file is owned by UID $uid, reassigning to a unique UID"
new_uid=$((unique_uids[0]+1))
# Update file ownership
chown "$new_uid:$new_uid" "$file"
fi
done
# Log the result
echo "UIDs have been reassigned and files have been reviewed"
}