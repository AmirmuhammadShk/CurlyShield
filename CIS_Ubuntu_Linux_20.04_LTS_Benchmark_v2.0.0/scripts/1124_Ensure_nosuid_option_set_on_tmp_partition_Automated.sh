sed -i 's/defaults,rw,nodev,noexec,relatime.*$/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /tmp