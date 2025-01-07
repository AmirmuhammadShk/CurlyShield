sed -i 's/nopat//; s/\s*/nosuid/g' /etc/fstab
mount -o remount,nosuid /tmp