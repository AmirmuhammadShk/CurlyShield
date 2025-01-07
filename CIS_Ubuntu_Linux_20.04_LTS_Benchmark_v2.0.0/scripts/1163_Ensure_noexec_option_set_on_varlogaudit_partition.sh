if [ -d "/var/log/audit" ]; then
echo "Updating fstab for /var/log/audit..." >&2
sed -i 's/\(defaults,rw,nosuid,nodev,\)\+noexec/,&\n\ndefaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
echo "Updated fstab successfully." >&2
else
echo "/var/log/audit does not exist. No action taken." >&2
fi
echo "Remounting /var/log/audit with configured options..." >&2
if mount -o remount /var/log/audit; then
echo "Remounted successfully."
else
echo "Failed to remount: $?" >&2
fi