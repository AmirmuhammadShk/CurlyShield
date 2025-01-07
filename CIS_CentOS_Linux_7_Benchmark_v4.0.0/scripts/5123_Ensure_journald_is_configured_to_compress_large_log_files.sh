echo "Compress=yes" >> /etc/systemd/journald.conf
systemctl restart systemd-journald.service