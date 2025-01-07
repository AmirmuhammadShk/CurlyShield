if [ -f /etc/systemd/system/rsyncd.socket ]; then
systemctl stop rsyncd.socket
systemctl disable rsyncd.socket
fi
if [ -f /etc/systemd/system/rsyncd.service ]; then
systemctl stop rsyncd.service
systemctl disable rsyncd.service
fi
yum remove --force rsync