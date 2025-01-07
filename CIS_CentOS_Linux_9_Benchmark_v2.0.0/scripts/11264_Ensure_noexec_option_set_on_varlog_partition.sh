if [ -d /var/log ]; then
# Edit the /etc/fstab file and add noexec to the fourth field
echo "1 $0 /var/log xfs defaults,rw,nosuid,nodev,noexec,relatime" >> /etc/fstab
# Run the command to remount /var/log with configured options
mount -o remount /var/log
else
# If no separate partition exists for /var/log, log a message
echo "No separate partition exists for /var/log. Please create one and add it to fstab."
fi