if [ -d "/dev/shm" ]; then
# Update fstab file to include noexec option
echo "tmpfs /dev/shm tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" >> /etc/fstab
fi
mount -o remount /dev/shm