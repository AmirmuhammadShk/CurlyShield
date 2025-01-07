nft create chain inet filter input { type filter hook input priority 0 ; }
nft create chain inet filter forward { type filter hook forward priority 0 ; }
nft create chain inet filter output { type filter hook output priority 0 ; }