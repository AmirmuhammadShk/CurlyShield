echo "mount -o remount,nodev /var/tmp" | sudo tee /etc/fstab >/dev/null 2>&1
sudo grep 'nodev' /etc/fstab