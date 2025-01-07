if [ ! -d "/var" ]; then
echo "Error: A separate partition does not exist for /var"
exit 1
fi
sed -i 's/defaults,rw,nosuid//g' /etc/fstab
sed -i 's/.*/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /var