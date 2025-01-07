echo "Edit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /var partition."
if ! mount -o remount /var; then
echo "Failed to remount /var"
exit 1
fi