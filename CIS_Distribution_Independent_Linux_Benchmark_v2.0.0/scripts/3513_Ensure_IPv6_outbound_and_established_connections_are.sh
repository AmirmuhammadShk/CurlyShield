ip6tables -A OUTPUT -p tcp --dport 0:65535 -j ACCEPT
ip6tables -A OUTPUT -p udp --dport 0:65535 -j ACCEPT
ip6tables -A OUTPUT -p icmp -j ACCEPT
ip6tables -A INPUT -p tcp --dport 0:65535 -m state --state ESTABLISHED,ESTABLISH --j ACCEPT
ip6tables -A INPUT -p udp --dport 0:65535 -m state --state ESTABLISHED,ESTABLISH --j ACCEPT
ip6tables -A INPUT -p icmp -m state --state ESTABLISHED,ESTABLISH --j ACCEPT
ip6tables -P INPUT ALLOW