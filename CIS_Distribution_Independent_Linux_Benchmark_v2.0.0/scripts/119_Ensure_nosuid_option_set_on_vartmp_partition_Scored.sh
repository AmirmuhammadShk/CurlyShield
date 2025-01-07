sed -i 's/[^ ]* \([^ ]*\) .*/\1,nosuid/g' /etc/fstab
mount -o remount,nosuid /var/tmp