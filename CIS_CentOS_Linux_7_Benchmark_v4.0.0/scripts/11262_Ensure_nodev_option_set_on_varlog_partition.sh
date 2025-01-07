if [ ! -d /var/log ]; then
# If not, create it
mkdir /var/log
fi
echo "devtmpfs /var/log tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" >> /etc/fstab
mount -o remount /var/log