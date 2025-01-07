sudo fdisk -c "mbr /dev/sda" # Assuming /dev/sda is the device containing all partitions
sudo mkpart /dev/sda1 1 100  # Create a new partition (sda1) with size of 100MB
sudo mkpartfs /dev/sda1 ext4  # Format sda1 as an ext4 filesystem
echo "/dev/sda1 /var/log ext4 defaults 0 2" | sudo tee -a /etc/fstab