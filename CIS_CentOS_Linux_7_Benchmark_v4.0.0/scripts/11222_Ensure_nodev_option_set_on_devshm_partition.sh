if [ -d /dev/shm ]; then
# Edit the /etc/fstab file to add nodev option
sed -i 's/defaults,rw,nosuid.*$/defaults,rw,nodev,noexec,relatime/' /etc/fstab
# Remount /dev/shm with new options
mount -o remount /dev/shm
fi
mount -o remount /dev/shm