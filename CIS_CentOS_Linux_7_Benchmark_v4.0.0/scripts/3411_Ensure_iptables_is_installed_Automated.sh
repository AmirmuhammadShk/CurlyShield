if ! grep -q "nftables" /etc/yum.repos.d/*.repo; then
# Install nftables using yum
yum install nftables
fi
systemctl disable iptables
systemctl enable nftables