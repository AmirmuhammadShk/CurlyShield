echo "nodev" >> /etc/fstab | sed -i '$a\nnodev' /etc/fstab
mount -o remount,nodev /dev/shm