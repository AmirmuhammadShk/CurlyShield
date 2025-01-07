sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime  0 /defaults,rw,nosuid,nodev,noexec,relatime,xattr,resuid,relsuid 0/' /etc/fstab
mount -o remount /var/tmp