dnf install nftables
systemctl enable nftables
systemctl start nftables
nft -v
systemctl status nftables