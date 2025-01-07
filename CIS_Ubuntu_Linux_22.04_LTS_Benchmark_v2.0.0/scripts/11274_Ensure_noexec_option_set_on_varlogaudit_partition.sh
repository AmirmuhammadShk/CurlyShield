if [ -d /var/log/audit ]; then
# Check if /etc/fstab file exists, create it if not
if [ ! -f /etc/fstab ]; then
touch /etc/fstab
fi
# Add noexec option to the fourth field of the audit partition
echo "/dev/sda7 /var/log/audit $fstype" >> /etc/fstab
echo "defaults,rw,nosuid,nodev,noexec,relatime 0 0" >> /etc/fstab
# Remount /var/log/audit with configured options
mount -o remount /var/log/audit
fi
echo "Test: Is the audit partition remounted with noexec option?"
mount | grep noexec