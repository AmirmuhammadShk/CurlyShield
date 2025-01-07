echo "defaults,rw,nosuid,nodev,noexec,relatime" | sudo tee -a /etc/fstab >> /dev/null 2>&1
sudo mount -o remount /tmp