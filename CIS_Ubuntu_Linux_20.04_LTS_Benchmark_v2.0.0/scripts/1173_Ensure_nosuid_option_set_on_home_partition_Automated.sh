if [ -d /home ]; then
# Edit /etc/fstab file and add nosuid option to /home partition
echo "device=<device>,fstype=<fstype>,options=defaults,rw,nosuid,nodev,relatime 0 0" | sudo tee -a /etc/fstab
# Remount /home with configured options
mount -o remount /home
else
# If /home partition does not exist, print a message
echo "/home partition does not exist"
fi