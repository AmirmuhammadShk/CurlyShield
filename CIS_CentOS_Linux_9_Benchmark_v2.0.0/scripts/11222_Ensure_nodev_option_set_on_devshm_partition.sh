if [ -d "/dev/shm" ]; then
# Add nodev option to fstab file for /dev/shm
echo "tmpfs /dev/shm tmpfs defaults,rw,nodev,noexec,relatime 0 0" >> /etc/fstab
# Remount /dev/shm with configured options
mount -o remount /dev/shm
else
# If /dev/shm partition does not exist, create a separate partition for it
# (This command assumes you have the necessary permissions and disk space)
echo "Creating /dev/shm partition..."
mkdir /dev/shm
fi