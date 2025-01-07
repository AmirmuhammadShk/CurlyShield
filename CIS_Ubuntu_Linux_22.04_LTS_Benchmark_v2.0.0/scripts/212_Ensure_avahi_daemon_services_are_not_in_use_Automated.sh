systemctl stop avahi-daemon.socket
systemctl stop avahi-daemon.service
apt purge avahi-daemon
if [ $? -eq 0 ]; then
systemctl mask avahi-daemon.socket
systemctl mask avahi-daemon.service
fi