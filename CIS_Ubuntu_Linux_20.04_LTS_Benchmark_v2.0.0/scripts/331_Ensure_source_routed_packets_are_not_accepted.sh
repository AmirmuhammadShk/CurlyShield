printf "net.ipv4.conf.all.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
sysctl -w net.ipv4.conf.all.accept_source_route=0
printf "net.ipv4.conf.default.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
sysctl -w net.ipv4.conf.default.accept_source_route=0
printf "net.ipv6.conf.all.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
sysctl -w net ipv6.conf.all.accept_source_route=0
printf "net.ipv6.conf.default.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
sysctl -w net.ipv6.conf.default.accept_source_route=0
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1