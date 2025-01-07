if [ -d "/var/log" ]; then
echo "Partition already exists"
else
# Recommendation for /var/log partition (Automated)
sudo fdisk --type=ext4 -m 1G /dev/sda1 > /etc/fstab || exit 1
fi
sudo sed -i 's/\/dev\/sda1\/\/var\/log\/.*//g' /etc/fstab
echo "/dev/sda1 /var/log ext4 defaults 0 2" >> /etc/fstab
sudo mount -a