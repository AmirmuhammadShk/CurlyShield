sed -i 's/\/tmp .*$/\/tmp \nodev/' /etc/fstab
mount -o remount,nodev /tmp