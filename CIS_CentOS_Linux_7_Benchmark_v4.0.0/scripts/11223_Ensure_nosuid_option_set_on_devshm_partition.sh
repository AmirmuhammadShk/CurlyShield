if [ -d "/dev/shm" ]; then
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options)
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nosuid/g' /etc/fstab
fi
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
mount -o remount /dev/shm
fi