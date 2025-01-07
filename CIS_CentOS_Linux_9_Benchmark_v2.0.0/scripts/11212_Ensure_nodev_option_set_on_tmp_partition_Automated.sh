if [ ! -d "/tmp" ]; then
echo "Separate partition for /tmp does not exist."
exit 1
fi
sed -i 's/^\/[^ ]* \/tmp.*$/&\t\nodev/' /etc/fstab
echo "Remounted /tmp with nodev option:"
mount -o remount /tmp