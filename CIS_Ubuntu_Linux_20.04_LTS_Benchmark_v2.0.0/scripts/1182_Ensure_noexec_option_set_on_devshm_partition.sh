sed -i 's defaults,rw,nosuid,nodev,noexec,relatime 0 0 defaults,rw,nosuid,nodev,noexec,relatime/g' /etc/fstab
mount -o remount -o nosexec /dev/shm