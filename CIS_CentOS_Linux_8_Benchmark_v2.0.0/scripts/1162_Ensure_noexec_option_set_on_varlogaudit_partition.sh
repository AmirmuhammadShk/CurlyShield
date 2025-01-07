sed -i 's/(defaults,rw,nosuid,nodev,)/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
mount -o remount /var/log/audit