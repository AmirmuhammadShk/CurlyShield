if [ -d "/var/log/audit" ]; then
awk '{print $4}' "/etc/fstab" | sed 's/defaults,rw,nosuid,nodev,noexec,relatime /defaults,rw,nosuid,nodev,noexec,relatime,nosuid/g'
mount -o remount,nosuid /var/log/audit
fi