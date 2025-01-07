iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -j DROP
sysctl -w net.ipv4.conf.all.accept_redirects=1
sysctl -w net.ipv4.conf.all.accept_source_route=1
sysctl -w net.ipv4.conf.default.accept_redirects=1
sysctl -w net.ipv4.conf.default.accept_source_route=1