if [ ! -d /home ]; then
echo "Creating /home partition"
sudo mkdir -p /home
fi
if [ -f /etc/fstab ]; then
echo "Configuring /etc/fstab"
sudo sed -i 's/\/dev\/.*\n//g' /etc/fstab
echo "/dev/sda4 /home ext4 defaults 0 2" >> /etc/fstab
fi
sudo parted --script -- /dev/sda \
--mklabel "ext4" --set 1 primary --set 2 secondary --set 3 boot
sudo echo "/dev/sda2 /home ext4 defaults 0 2" >> /etc/fstab