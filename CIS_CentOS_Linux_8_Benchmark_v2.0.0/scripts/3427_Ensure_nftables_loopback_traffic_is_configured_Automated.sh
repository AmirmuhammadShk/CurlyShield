nft add rule inet filter input iif lo accept
nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop
[ ! -d /etc/nftables/IPv6 ] && nft add rule inet filter input ip6 saddr ::1 counter drop