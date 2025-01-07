if [ -d /var/log/audit ]; then
echo "defaults,rw,nosuid,nodev,noexec,relatime" >> /etc/fstab
mount -o remount /var/log/audit
fi