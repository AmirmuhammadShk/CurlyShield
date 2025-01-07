nft create table inet filter
nft create rule inet filter ip dport 80 proto tcp accept
nft create rule inet filter ip dport 22 proto tcp listen on any accept
nft create rule inet filter ip dport 443 proto tcp accept
nft create rule inet filter ip dport 3306 proto tcp accept