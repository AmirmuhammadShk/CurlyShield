systemctl unmask tmp.mount
echo "tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime,size=2G 0" | sudo tee -a /etc/fstab