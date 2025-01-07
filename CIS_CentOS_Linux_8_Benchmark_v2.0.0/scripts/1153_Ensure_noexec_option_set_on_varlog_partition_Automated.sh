sed -i 's/.*nosuid.*$/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /var/log