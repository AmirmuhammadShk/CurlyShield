echo "Edit the /etc/fstab file and add nodev option" >> /var/log/changes.log 2>&1
sudo sed -i 's/.*nodev.*/nodev' /etc/fstab || echo "Failed to edit fstab: $?"
echo "Run the following command to remount /tmp" >> /var/log/changes.log 2>&1
sudo mount -o remount,nodev /tmp