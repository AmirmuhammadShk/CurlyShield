nft add rule inet filter output ip protocol tcp ct state new,established accept
nft add rule inet filter output ip protocol udp ct state new,established accept
nft add rule inet filter output ip protocol icmp ct state new,established accept
nft add rule inet filter input ip protocol tcp ct state established accept
nft add rule inet filter input ip protocol udp ct state established accept
nft add rule inet filter input ip protocol icmp ct state established accept