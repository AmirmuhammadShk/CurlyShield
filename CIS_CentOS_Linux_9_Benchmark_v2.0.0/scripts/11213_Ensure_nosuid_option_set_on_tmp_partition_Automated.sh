if [ -d "/tmp" ]; then
# Edit the /etc/fstab file and add nosuid to the mounting options
echo " Mounting /tmp with nosuid option..." >&2
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime defaults,rw,nosuid/nodev,noexec,relatime/' /etc/fstab
# Remount /tmp with the configured options
echo "Remounting /tmp with nosuid option..." >&2
mount -o remount /tmp
else
echo "No separate partition exists for /tmp" >&2
fi