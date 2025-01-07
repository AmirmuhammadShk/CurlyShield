sed -i '/ForwardToSyslog/d' /etc/systemd/journald.conf
systemctl restart systemd-journal-upload