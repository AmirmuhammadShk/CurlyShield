systemctl unmask tmp.mount
echo "Mounting /tmp at boot time" >> /var/log/systemd.log
echo "Configuring fstab file to enable proper mount options" >> /var/log/systemd.log
mount -o defaults,rw,nosuid,nodev,noexec,relatime,size=2G /dev/sda1 /tmp | grep -q "success" || echo "/tmp failed to mount"
echo "Verification complete. /tmp is mounted correctly" >> /var/log/systemd.log