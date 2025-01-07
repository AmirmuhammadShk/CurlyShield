sed -i 's/defaults,rw,nosuid/nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /var/tmp