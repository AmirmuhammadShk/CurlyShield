systemctl stop isc-dhcp-server.service isc-dhcp-server6.service
apt purge isc-dhcp-server
if apt show isc-dhcp-server | grep "Replaces:"; then
systemctl stop isc-dhcp-server.service isc-dhcp-server6.service
systemctl mask isc-dhcp-server isc-dhcp-server6.service
fi