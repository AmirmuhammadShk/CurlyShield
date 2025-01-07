/etc/systemd/journald.conf.d/ and add the following line:
echo "Storage=persistent" | tee /etc/systemd/journald.conf || echo "Error writing to journald.conf"
systemctl restart systemd-journald