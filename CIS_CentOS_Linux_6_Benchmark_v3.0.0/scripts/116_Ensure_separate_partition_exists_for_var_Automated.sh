sudo fdisk -c "m; s /dev/sda1 2 > /dev/null" || true
sudo mkfs.ext4 /dev/sda1
sudo mount /dev/sda1 /var
sudo echo "/dev/sda1 /var ext4 defaults 0 2" | sudo tee -a /etc/fstab