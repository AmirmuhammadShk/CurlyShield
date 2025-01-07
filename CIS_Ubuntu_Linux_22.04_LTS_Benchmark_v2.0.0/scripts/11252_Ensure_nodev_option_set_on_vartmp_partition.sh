if [ ! -d "/var/tmp" ]; then
echo "Error: A separate partition does not exist for /var/tmp"
exit 1
fi
echo "Updating /etc/fstab file..." >> /var/log/update_fstab.log
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime /defaults,rw,nosuid,nodev,noexec,relatime,nodev/' /etc/fstab
echo "Remounting /var/tmp..." >> /var/log/remount_fstab.log
mount -o remount /var/tmp