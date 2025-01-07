echo "Storage=persistent" >> /etc/systemd/journald.conf
systemctl restart systemd-journald.service