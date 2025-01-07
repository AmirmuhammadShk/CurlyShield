if [ -d "/var/tmp" ]; then
sed -i "s/defaults,rw,nosuid,noexec,relatime/\ndefaults,rw,nosuid,nodev,noexec,relatime/g" /etc/fstab
mount -o remount /var/tmp
fi