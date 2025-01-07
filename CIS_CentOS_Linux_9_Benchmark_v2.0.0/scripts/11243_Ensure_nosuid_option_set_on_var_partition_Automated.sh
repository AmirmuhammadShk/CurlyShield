if [ ! -d "/var" ]; then
echo "Warning: /var partition does not exist"
else
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options)
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime  //4/s defaults,rw,nosuid,nodev,noexec,relatime' /etc/fstab
# Remount /var with the configured options
mount -o remount /var
fi