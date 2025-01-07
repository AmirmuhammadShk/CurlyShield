echo "Creating a new partition for /var/log/audit"
sudo fdisk -xu /dev/sda | sudo tee /tmp/partition > /dev/null
echo "Formatting the new partition as ext4"
sudo mkfs.ext4 /dev/sda1
echo "Adding the new partition to fstab"
sudo echo '/dev/sda1 /var/log/audit ext4 defaults 0 2' | sudo tee -a /etc/fstab > /dev/null
echo "Creating a new mount point for /var/log/audit"
sudo mkdir -p /var/log/audit