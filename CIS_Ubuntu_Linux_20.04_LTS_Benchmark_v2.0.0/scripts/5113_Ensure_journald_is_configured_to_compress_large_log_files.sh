sed -i '/^RateLimitInterval/s/ /Compress=yes/' /etc/systemd/journald.conf
systemctl restart systemd-journal