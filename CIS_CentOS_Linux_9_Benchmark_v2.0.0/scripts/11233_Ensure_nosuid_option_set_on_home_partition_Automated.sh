if [ ! -d "/home" ]; then
echo "A separate partition does not exist for /home"
exit 1
fi
echo "Updating /etc/fstab file..."
awk -v option="nosuid" 'NR==4 { $4=option } {print}' /etc/fstab > /tmp/fstabtemp && mv /tmp/fstabtemp /etc/fstab
echo "Remounting /home with nosuid option..."
mount -o remount -o rw,nosuid,nodev,noexec,relatime /home