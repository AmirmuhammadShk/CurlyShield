echo "nosuid" >> /etc/fstab | sed '4s/.*/\1 nosuid/'
mount -o remount,nosuid /dev/shm