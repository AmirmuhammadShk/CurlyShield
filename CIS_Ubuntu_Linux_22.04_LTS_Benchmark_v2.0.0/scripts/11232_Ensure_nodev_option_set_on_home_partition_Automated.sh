if [ ! -d "/home" ]; then
echo "Separate partition does not exist for /home"
exit 1
fi
sed -i 's/defaults,rw,nosuid,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
if mount -o remount /home; then
echo "Remounted /home successfully"
else
echo "Failed to remount /home"
exit 1
fi