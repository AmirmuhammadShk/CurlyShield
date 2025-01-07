systemctl stop avahi-daemon.socket avahi-daemon.service
yum remove --force avahi
if [ $? -ne 0 ]; then
systemctl stop avahi-daemon.socket avahi-daemon.service
systemctl mask avahi-daemon.socket avahi-daemon.service
fi