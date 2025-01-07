audit_suid_executables() {
# Check if SUID executables need to be audited
if [ -n "$(find / -type f -perm -2000 -print)" ]; then
# Review the files returned by the action in the Audit section
audit_files=$(find / -type f -perm -2000)
# Confirm the integrity of these binaries
for file in $audit_files; do
checksum=$(sha256sum $file | cut -d' ' -f1)
if [ -z "$checksum" ]; then
echo "SUID executable found with unknown checksum: $file"
fi
done
else
echo "No SUID executables need to be audited."
fi
}
audit_suid_executables