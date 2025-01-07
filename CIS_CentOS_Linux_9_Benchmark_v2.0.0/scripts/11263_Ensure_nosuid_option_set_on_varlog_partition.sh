if [ -d /var/log ]; then
# Edit fstab file to add nosuid option
sed -i 's/defaults/rw,nosuid,nodev,noexec,relatime/g' /etc/fstab
# Remount /var/log with configured options
mount -o remount /var/log
else
echo "Separate /var/log partition does not exist."
fi