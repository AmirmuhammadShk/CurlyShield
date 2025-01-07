echo "nosuid" >> /etc/fstab | sed '4s/.*/nosuid/'
mount -o remount,nosuid /var/tmp