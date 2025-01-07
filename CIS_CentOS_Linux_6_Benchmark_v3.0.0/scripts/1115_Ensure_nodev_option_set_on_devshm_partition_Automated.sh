echo "Adding nodev option to /etc/fstab"
sed -i 's/.*nodev.*/$0 nodev/' /etc/fstab
mount -o remount,nodev /dev/shm