if [ ! -d "/tmp" ]; then
echo "Error: /tmp partition does not exist."
exit 1
fi
sed -i '/^\/tmp/a \n  nodev' /etc/fstab
mount -o remount /tmp