if ! du -s /proc/self/status > /dev/null; then
# No duplicates, proceed with auditing
audit_script
else
# Duplicate UIDs found, create unique UIDs and re-audit
mkid=$(mktemp)
while read uid; do
echo "$uid" >> "$mkid"
done < <(getent passwd | cut -d: -f1)
uniqids=$(sort -u < "$mkid")
rm "$mkid"
# Review files owned by shared UIDs
for file in $(find / -type f -print0); do
uid=$(stat -c "%u" "$file")
if echo "$uid" | grep -qE '\b[0-9]+([0-9]+)\b'; then
# File is owned by a shared UID, assign it the unique ID
chown "$uid" "$file"
fi
done
# Re-audit to ensure UIDs are valid
audit_script
fi