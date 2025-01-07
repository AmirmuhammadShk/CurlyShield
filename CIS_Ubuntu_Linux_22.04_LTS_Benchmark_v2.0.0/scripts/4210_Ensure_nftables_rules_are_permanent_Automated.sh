echo "Enabling permanent nftables rules..."
sudo echo 'rules {
include "/etc/nftables.rules"
}' >> /etc/nftables.conf
sudo systemctl restart nftables