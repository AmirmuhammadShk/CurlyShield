systemctl stop dhcpd.service
systemctl stop dhcpd6.service
dnf remove dhcp-server
if dnf isenabled dhcp-server; then
systemctl mask dhcpd.service
fi