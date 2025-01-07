if [ -d /var/log ]; then
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /var/log partition
echo "nosuid" >> /etc/fstab | grep -q "^defaults,rw,nosuid,nodev,noexec,relatime" || sed -i 's/defaults,rw,n.*\n/nosuid,rw,n.*noexec,relatime/' /etc/fstab
# Run the following command to remount /var/log with the configured options
mount -o remount /var/log
fi