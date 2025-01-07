if [ -d "/var/log/audit" ]; then
# Edit the /etc/fstab file and add nodev to the fourth field for the /var/log/audit partition
sed -i 's/defaults,rw,nosuid,noexec,relatime.*/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
# Remount /var/log/audit with the configured options
mount -o remount /var/log/audit
fi