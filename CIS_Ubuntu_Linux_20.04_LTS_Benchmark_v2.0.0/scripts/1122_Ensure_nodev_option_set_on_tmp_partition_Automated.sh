sed -i 's/defaults/rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /tmp