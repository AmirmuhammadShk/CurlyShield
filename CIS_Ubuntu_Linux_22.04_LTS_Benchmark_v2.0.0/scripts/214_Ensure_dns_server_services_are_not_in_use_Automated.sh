systemctl stop bind9.service
apt purge bind9
if [ $? -ne 0 ]; then
systemctl stop bind9.service
systemctl mask bind9.service
fi