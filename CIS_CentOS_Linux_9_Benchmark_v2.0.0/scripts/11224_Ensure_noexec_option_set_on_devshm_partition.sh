if [ -d /mnt/shm ]; then
# Edit the /etc/fstab file to add noexec option
echo "tmpfs /mnt/shm tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" >> /etc/fstab
fi
mount -o remount /dev/shm