if [ -d "/var" ]; then
echo "Partition already exists"
else
mkfs.ext4 /dev/sdb1 # Replace with the desired file system type and device
mount /dev/sdb1 /var
echo "/dev/sdb1 /var ext4 defaults 0 2" >> /etc/fstab
fi