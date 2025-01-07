sed -i 's/[^ ]* \([^ ]*\)\([^ ]*\)\(.*\)/\1 \2 \3,nodev/' /etc/fstab
sudo mount -o remount,nodev /home