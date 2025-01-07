if [ ! -d "/var/tmp" ]; then
# If not, create it as a separate partition
mkdir -p "/var/tmp"
fi
echo "defaults,rw,nosuid,nodev,noexec,relatime" >> /etc/fstab
mount -o remount /var/tmp