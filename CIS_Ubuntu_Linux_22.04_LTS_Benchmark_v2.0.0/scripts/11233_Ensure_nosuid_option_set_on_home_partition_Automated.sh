if [ -d "/home" ]; then
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /home partition
sed -i 's|^.*nosuid.*|defaults,rw,nosuid,nodev,noexec,relatime|' /etc/fstab
# Run the following command to remount /home with the configured options
mount -o remount /home
fi