systemctl unmask nftables.service
systemctl --now enable nftables.service
systemctl start nftables.service