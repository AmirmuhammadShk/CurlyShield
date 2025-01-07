sed -i 's/.*Compression.*$/Compression=on Compress=yes/g' /etc/systemd/journald.conf
systemctl daemon-reload