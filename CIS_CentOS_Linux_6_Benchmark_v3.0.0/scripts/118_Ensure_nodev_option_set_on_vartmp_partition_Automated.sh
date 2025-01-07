echo "mount -o remount,nodev /var/tmp" | sudo tee /etc/fstab > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "CIS Control 1.1.8 implemented"
else
echo "Error implementing CIS Control 1.1.8"
fi