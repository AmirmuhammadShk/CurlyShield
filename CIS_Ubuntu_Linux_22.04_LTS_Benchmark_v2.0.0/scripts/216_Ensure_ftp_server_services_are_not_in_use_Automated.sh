systemctl stop vsftpd.service
if [ -d "/etc/systemd/system" ]; then
systemctl mask vsftpd.service
fi
apt purge --auto-remove vsftpd