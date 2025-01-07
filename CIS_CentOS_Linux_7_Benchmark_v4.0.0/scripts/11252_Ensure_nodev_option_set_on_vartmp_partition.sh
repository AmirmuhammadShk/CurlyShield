if [ ! -d /var/tmp ]; then
# If not, create it
mkdir -p /var/tmp
fi
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nodev/g' /etc/fstab
mount -o remount /var/tmp