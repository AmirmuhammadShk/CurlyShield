if [ -d /var/log/audit ]; then
# Edit the /etc/fstab file and add noexec to the fourth field (mounting options)
echo "defaults,rw,nosuid,nodev,noexec,relatime" >> /etc/fstab
# Remount /var/log/audit with the configured options
mount -o remount /var/log/audit
fi
mount -o remount /var/log/audit