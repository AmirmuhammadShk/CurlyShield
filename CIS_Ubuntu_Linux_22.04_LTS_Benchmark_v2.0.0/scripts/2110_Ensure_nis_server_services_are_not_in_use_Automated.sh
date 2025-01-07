systemctl stop ypserv.service
apt purge ypserv
if [ -f /etc/apt/sources.list ]; then
apt update
systemctl mask ypserv.service
fi