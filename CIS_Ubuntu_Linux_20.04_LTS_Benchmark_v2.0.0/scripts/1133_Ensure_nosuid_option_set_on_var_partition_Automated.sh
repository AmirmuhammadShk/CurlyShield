if [ -d /var ]; then
# Edit the fstab file and add nosuid option to the fourth field
echo "/var $fstype defaults,rw,nosuid,nodev,relatime" | sudo tee -a /etc/fstab
# Remount /var with configured options
mount -o remount /var
else
# Print a message if /var partition does not exist
echo "The /var partition does not exist."
fi