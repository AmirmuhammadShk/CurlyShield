if [ ! -d /var/log ]; then
echo "Warning: No separate partition exists for /var/log."
else
sed -i 's/defaults,rw,nosuid,nodev,relatime/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
fi
mount -o remount /var/log