if [ -d "/var/log/audit" ]; then
# If it does, edit the /etc/fstab file and add nodev to the mounting options
echo "defaults,rw,nosuid,nodev,noexec,relatime" >> /etc/fstab
fi
mount -o remount,/var/log/audit