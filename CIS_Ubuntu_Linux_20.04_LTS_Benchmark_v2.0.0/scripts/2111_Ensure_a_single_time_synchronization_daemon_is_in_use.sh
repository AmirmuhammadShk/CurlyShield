apt install -y ntp
systemctl stop systemd-timesyncd.service
systemctl --now mask systemd-timesyncd.service
apt purge chrony
apt purge ntp
echo "server 1.2.3.4 iburst" | tee /etc/ntp.conf
systemctl start ntp