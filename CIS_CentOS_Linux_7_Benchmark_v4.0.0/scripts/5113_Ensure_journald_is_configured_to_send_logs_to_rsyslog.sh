echo "ForwardToSyslog=yes" | sudo tee /etc/systemd/journald.conf
sudo systemctl reload systemd-journald