printf "net.ipv4.conf.all.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf "net.ipv4.conf.default.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf "net.ipv4.route.flush=1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
if [ -f /etc/sysctl.conf ]; then
printf "net.ipv6.conf.all.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
printf "net.ipv6.conf.default.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
printf "net.ipv6.route.flush=1\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
sysctl -w net.ipv4.conf.all.accept_source_route=0
sysctl -w net.ipv4.conf.default.accept_source_route=0
sysctl -w net.ipv4.route.flush=1
if [ -f /etc/sysctl.conf ]; then
sysctl -w net.ipv6.conf.all.accept_source_route=0
sysctl -w net.ipv6.conf.default.accept_source_route=0
sysctl -w net.ipv6.route.flush=1
fi