sudo fdisk -c "m; n; s 1 2G; w" > /dev/null
mkdir -p /mnt/var
sudo mount /dev/sda2 /mnt/var > /dev/null
echo "/dev/sda2 /var ext4 defaults 0 2" >> /etc/fstab