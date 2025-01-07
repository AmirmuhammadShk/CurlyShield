systemctl stop slapd.service
if [ $? -eq 0 ]; then
systemctl mask slapd.service
fi
apt purge slapd --purge
dpkg-reconfigure --reinstall slapd