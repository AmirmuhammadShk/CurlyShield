if [ -f /etc/passwd ]; then
# Get existing UIDs and their corresponding usernames
existing_uids=$(cut -d: -f1 /etc/passwd | sort -u)
# Check for duplicate UIDs
if grep -q "$existing_uids" /etc/group; then
echo "Warning: Duplicate UIDs found in /etc/passwd and /etc/group."
echo "Review and update /etc/passwd to remove duplicates."
# Get files owned by shared UIDs
for group in $(cat /etc/group | awk '{print $1}'); do
for file in $(find / -type f -user "$group" -print); do
echo "File $file is currently owned by UID $group. Review and update ownership."
done
done
fi
fi