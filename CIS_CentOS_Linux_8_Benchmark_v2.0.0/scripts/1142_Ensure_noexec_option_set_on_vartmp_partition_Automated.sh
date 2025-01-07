sed -i '/\/var\/tmp/c \n defaults,rw,nosuid,nodev,noexec,relatime' /etc/fstab
mount -o remount /var/tmp