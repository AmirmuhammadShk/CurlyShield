if [ -d "/var/tmp" ]; then
# Add nosuid option to fstab file
echo "nosuid" >> "/etc/fstab"
else
# Log message if /var/tmp partition does not exist
echo "Error: /var/tmp partition does not exist."
fi
mount -o remount /var/tmp