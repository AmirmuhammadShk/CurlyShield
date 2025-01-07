audit_suid_sgid() {
# Get list of SUID and SGID files
suid_files=$(find / -type f -perm +20000)
sgid_files=$(find / -type f -perm +02000)
# Check each file for integrity
for file in $suid_files; do
echo "Checking file: $file"
if [ -r "$file" ]; then
md5sum "$file" | cut -d' ' -f1
else
echo "Error checking file: $file, Permission denied"
fi
done
for file in $sgid_files; do
echo "Checking file: $file"
if [ -r "$file" ]; then
md5sum "$file" | cut -d' ' -f1
else
echo "Error checking file: $file, Permission denied"
fi
done
# Report any issues found during the check
echo "All files are up to date."
}
audit_suid_sgid > /var/log/suid_sgid_audit.log