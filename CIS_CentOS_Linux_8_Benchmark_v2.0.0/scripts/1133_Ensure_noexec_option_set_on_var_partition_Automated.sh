sed -i 's/defaults,rw,nosuid,nodev,noatime/\$*noexec,rw,nosuid,nodev,noatime/g' /etc/fstab
mount -o remount /var