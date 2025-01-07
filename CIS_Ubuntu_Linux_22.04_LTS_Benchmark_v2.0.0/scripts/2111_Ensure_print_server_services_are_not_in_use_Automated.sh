systemctl stop cups.socket cups.service
apt purge cups
if [ $? -ne 0 ]; then
systemctl mask cups.socket cups.service
fi