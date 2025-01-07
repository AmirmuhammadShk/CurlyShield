systemctl stop bluetooth.service
apt purge bluez
if ! apt isinstalled bluez; then
systemctl stop bluetooth.service
systemctl mask bluetooth.service
fi