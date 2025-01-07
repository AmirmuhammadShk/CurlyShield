if [ ! -d /var/log/audit ]; then
echo "Separate partition for /var/log/audit does not exist. Please create it before proceeding."
exit 1
fi
echo "Adding nodev option to /var/log/audit partition in fstab..." >> /etc/fstab
sed -i 's/defaults,rw,nosuid,.*$/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
if [ ! -f /etc/fstab ]; then
echo "Error modifying fstab file."
exit 1
fi
echo "Remounting /var/log/audit partition with nodev option..." >> /dev/null
mount -o remount /var/log/audit