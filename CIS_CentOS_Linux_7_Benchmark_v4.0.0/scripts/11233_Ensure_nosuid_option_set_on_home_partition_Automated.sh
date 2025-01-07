if [ ! -d "/home" ]; then
echo "The /home partition does not exist."
exit 1
fi
dev="/dev/$HOME"
fstype="ext4"
sed -i 's/[^,]*\)/$dev $fstype defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount "$dev"