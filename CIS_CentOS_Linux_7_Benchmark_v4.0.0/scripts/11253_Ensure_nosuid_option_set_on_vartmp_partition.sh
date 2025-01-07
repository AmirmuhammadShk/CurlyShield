if [ -d /var/tmp ]; then
# Update fstab file to include nosuid option
echo "/dev/sda5 /var/tmp ext4 defaults,rw,nosuid,nodev,noexec,relatime 0 2" | sudo tee -a /etc/fstab
# Remount /var/tmp with configured options
mount -o remount /var/tmp
fi