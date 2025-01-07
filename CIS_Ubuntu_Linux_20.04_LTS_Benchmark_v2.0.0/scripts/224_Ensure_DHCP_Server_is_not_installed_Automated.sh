if dpkg -s isc-dhcp-server &> /dev/null; then
# Remove isc-dhcp-server package
apt purge isc-dhcp-server
fi