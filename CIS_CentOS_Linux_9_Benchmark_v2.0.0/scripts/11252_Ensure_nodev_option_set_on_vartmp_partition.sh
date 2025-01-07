if [ -d /var/tmp ]; then
# Edit the /etc/fstab file and add nodev option
echo "Mounting options: defaults,rw,nosuid,nodev,noexec,relatime" | sudo tee /etc/fstab >> /etc/fstab || echo "Error adding nodev option to fstab"
# Remount /var/tmp with the configured options
mount -o remount /var/tmp
fi