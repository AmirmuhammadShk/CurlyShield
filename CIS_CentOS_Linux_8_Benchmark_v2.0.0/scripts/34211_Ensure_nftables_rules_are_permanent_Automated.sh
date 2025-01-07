echo "include /etc/nftables/nftables.rules" >> /etc/sysconfig/nftables.conf
if [ ! -f "/etc/sysconfig/nftables.conf" ]; then
echo "Error: /etc/sysconfig/nftables.conf does not exist."
exit 1
fi