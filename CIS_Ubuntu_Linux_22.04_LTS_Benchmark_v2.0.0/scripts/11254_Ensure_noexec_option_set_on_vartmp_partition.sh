if [ ! -d "/var/tmp" ]; then
echo "No separate partition exists for /var/tmp"
else
# Edit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /var/tmp partition
sed -i 's/defaults,rw,nosuid,nodev,relatime/defaults,rw,nosuid,nodev,noexec,relatime/g' /etc/fstab
# Run the command to remount /var/tmp with the configured options
mount -o remount /var/tmp
echo "Remounted /var/tmp with noexec option"
fi