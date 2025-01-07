sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/rw,nosuid,nodev,noexec,relatime/g' /etc/fstab
mount -o remount /tmp