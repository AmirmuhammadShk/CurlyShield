systemctl unmask ntp.service
systemctl --now enable ntp.service
apt purge ntp