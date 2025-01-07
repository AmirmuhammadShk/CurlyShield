if [ -d /var/log ]; then
# Edit the /etc/fstab file and add nodev to the fourth field (mounting options)
echo "nodev" >> /etc/fstab
# Run the following command to remount /var/log with the configured options
mount -o remount /var/log
fi