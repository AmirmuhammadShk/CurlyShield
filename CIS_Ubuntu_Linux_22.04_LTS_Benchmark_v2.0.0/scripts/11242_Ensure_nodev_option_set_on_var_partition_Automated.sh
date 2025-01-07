if [ -d /var ]; then
# Edit the /etc/fstab file and add nodev to the fourth field (mounting options)
sed -i 's/defaults,rw,nosuid,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
# Run the command to remount /var with the configured options
mount -o remount /var
fi