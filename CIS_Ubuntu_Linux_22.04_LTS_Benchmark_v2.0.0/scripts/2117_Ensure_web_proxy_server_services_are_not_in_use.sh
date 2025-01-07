systemctl stop squid.service
apt purge --auto-remove squid
if [ $? -eq 0 ]; then
systemctl mask squid.service
fi