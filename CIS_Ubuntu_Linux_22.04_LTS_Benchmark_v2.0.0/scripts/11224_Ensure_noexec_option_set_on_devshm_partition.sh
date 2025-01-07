if [ ! -d "/dev/shm" ]; then
echo "Error: /dev/shm partition does not exist."
exit 1
fi
sed -i 's/\(.*\),\(.*\),.*\)/\1 $2 defaults,rw,nosuid,nodev,noexec,relatime \2/' /etc/fstab
mount -o remount -o nosuid /dev/shm