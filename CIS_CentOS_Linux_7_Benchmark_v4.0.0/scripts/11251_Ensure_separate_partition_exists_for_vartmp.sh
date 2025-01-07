echo "Creating custom partition setup..." >> /var/log/install.log
sudo parted --script /dev/sda mklabel 'ext4' || echo "Failed to create partition"
if [ -f /etc/fstab ]; then
echo "Configuring /etc/fstab..."
sudo nano /etc/fstab
else
echo "/etc/fstab not found. Creating a new one."
sudo echo '/var/tmp   ext4    defaults        0 2' >> /etc/fstab
fi