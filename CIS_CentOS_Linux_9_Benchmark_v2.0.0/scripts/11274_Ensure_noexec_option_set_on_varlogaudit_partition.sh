if [ -d "/var/log/audit" ]; then
# Update fstab file to include noexec option
echo "defaults,rw,nosuid,nodev,noexec,relatime" >> "/etc/fstab"
fi
mount -o remount /var/log/audit