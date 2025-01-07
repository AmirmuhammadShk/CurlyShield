if [ ! -d "/var/tmp" ]; then
echo "A separate partition does not exist for /var/tmp"
exit 1
fi
sed -i 's/nosuid defaults,rw,nosuid,nodev,noexec,relatime 0/defaults,rw,nosuid,nodev,noexec,relatime nosuid/g' /etc/fstab
mount -o remount /var/tmp