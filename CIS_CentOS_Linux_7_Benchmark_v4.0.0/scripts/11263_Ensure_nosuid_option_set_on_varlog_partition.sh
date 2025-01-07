if [ -d "/var/log" ]; then
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options)
sed -i 's/defaults,rw,nodev,noexec,relatime//4' /etc/fstab
sed -i 's/#<device> <fstype> defaults,rw,nosuid,nodev,noexec,relatime 0 <device> <fstype> defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
# Remount /var/log with the configured options
mount -o remount,nosuid /var/log
else
echo "A separate partition does not exist for /var/log"
fi