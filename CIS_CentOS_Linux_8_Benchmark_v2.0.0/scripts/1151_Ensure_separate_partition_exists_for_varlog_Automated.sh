sudo fdisk -c "m < /dev/sda"  # Create empty partition table for /dev/sda
sudo mkpart swap 1 100M  # Create swap partition, only the first 100MB is used
sudo mkpart primary 100M ${#blockdevice}  # Create a separate partition for /var/log
echo "/dev/sda2 /var/log xfs defaults,noatime 0 2" | sudo tee -a /etc/fstab