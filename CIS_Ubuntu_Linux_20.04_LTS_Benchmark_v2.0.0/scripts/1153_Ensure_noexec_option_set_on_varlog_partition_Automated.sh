if [ -d /var/log ]; then
# Edit /etc/fstab to add noexec option
sed -i 's/defaults,rw,nosuid,nodev,relatime/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
# Remount /var/log with new options
mount -o remount /var/log
fi