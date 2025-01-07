if [ ! -d "/tmp" ]; then
echo "Error: No /tmp partition found"
exit 1
fi
sed -i 's/defaults,rw,nosuid,nodev,relatime/defaults,rw,nosuid,nodev,noexec,relatime/g' /etc/fstab
mount -o remount /tmp