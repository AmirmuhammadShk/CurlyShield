sudo fdisk -c "mbr /dev/sda" || true # overwrite existing boot sector
sudo mkswap /dev/sda2  # create swap partition
sudo mkpart ext4 1 2  # create ext4 partition for /var/log/audit
echo "/dev/sda2  /var/log/audit    swap  defaults 0 2" | sudo tee -a /etc/fstab