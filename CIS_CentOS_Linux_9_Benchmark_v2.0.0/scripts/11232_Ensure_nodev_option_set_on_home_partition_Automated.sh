if [ -d "/home" ]; then
# Edit fstab file to add nodev option
sed -i 's/defaults,rw,nosuid,noexec,relatime  0 0/defaults,rw,nosuid,nodev,noexec,relatime  0 0/' /etc/fstab
# Remount /home with configured options
mount -o remount /home
fi