echo "Updating /etc/fstab file..."
current_fstab=$(cat /etc/fstab)
new_fstab=$(sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nodev/g' /etc/fstab)
echo "Updated fstab file: $new_fstab"
if mount -o remount /home; then
echo "/home remounted successfully"
else
echo "Failed to remount /home"
fi