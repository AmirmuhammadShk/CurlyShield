mkdir -p /var/log/audit
if [ ! -d /var/log/audit ]; then
echo "Error: /var/log/audit does not exist"
exit 1
fi
echo "/dev/mapper/<mount_point> /var/log/audit ext4 defaults 0 2" >> /etc/fstab