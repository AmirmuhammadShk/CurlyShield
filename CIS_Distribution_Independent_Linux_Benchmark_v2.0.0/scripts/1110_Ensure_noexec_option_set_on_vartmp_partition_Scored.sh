sed -i 's/^\(.*\).*\(noexec\|noexec,\).*$/\1,noexec,' /etc/fstab
mount -o remount,noexec /var/tmp