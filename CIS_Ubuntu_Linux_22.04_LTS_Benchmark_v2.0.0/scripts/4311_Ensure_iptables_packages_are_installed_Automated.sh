if ! dpkg -s iptables | grep -q 'installed'; then
# Install iptables and iptables-persistent
apt install iptables iptables-persistent
fi
service iptables start
update-rc.d iptables defaults