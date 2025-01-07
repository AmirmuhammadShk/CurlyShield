if [ -d /var/log ]; then
# Get current fstab file
fstab=$(cat /etc/fstab)
# Find the line with /var/log and update options
updated_fstab=$(sed -i "/^\/var\/log/ s/$/defaults,rw,nosuid,nodev,noexec,relatime/" /etc/fstab)
# Update fstab file
echo "$updated_fstab" > /etc/fstab
# Remount /var/log with new options
mount -o remount /var/log
fi