if [ ! -d /var/log/audit ]; then
echo "Error: /var/log/audit partition does not exist"
exit 1
fi
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nodev/g' /etc/fstab
mount -o remount /var/log/audit