if systemctl status systemd-timesyncd.service | grep Active; then
systemctl unmask systemd-timesyncd.service
systemctl --now enable systemd-timesyncd.service
else
systemctl --now mask systemd-timesyncd.service
fi