if [ -d "/var/log" ]; then
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nofail,x-systemd.device-timeout=1/' /etc/fstab
mount -o remount /var/log
fi
mount -a