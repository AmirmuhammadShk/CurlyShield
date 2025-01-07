echo "include /etc/nftables/nftables.rules" >> /etc/sysconfig/nftables.conf
sudo sysctl -w net.nf_tables.load=1
sudo sysctl -w net.nf_tables.filter=1