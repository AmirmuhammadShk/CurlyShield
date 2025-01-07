echo "nodev" >> /etc/fstab | sed 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nodev/g'
mount -o remount /tmp