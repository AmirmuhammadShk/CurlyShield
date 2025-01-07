if [ ! -d /var/tmp ]; then
echo "Error: /var/tmp partition does not exist."
exit 1
fi
fstab_entry=$(grep "^/var/tmp" /etc/fstab | head -n 1)
if [ -z "$fstab_entry" ]; then
echo "/dev/[partition_device] /var/tmp none nosuid,nodev,noexec,relatime 0 0" >> /etc/fstab
fi
sed -i 's/defaults,rw,nosuid,nodev/.defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /var/tmp