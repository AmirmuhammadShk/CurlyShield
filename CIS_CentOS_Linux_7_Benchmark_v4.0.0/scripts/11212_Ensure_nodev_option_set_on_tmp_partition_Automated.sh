if [ -d "/tmp" ]; then
# If it does, edit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /tmp partition
echo "Editing /etc/fstab file..."
sed -i 's/defaults,rw,nosuid//; s/nodev/noexec/r' /etc/fstab
# Remount /tmp with the configured options
echo "Remounting /tmp with nodev option..."
mount -o remount,nodev /tmp
fi
if [ ! -d "/tmp" ]; then
echo "Error: A separate partition does not exist for /tmp."
fi