printf "net.ipv4.icmp_echo_ignore_broadcasts = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sysctl -w net.ipv4.route.flush=1