printf '%s\n' "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf '%s\n' "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.d/60-netipv4_sysctl.conf
if [ -n "$( grep net.ipv6.conf.all.accept_source_route /etc/sysctl.conf )" ] || [ -n "$( grep net.ipv6.conf.all.accept_source_route /etc/sysctl.d/*.conf )" ]; then
printf '%s\n' "net.ipv6.conf.all.accept_source_route = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
printf '%s\n' "net.ipv6.conf.default.accept_source_route = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
if [ -n "$( grep net.ipv6.conf.all.accept_source_route /etc/sysctl.conf )" ] || [ -n "$( grep net.ipv6.conf.all.accept_source_route /etc/sysctl.d/*.conf )" ]; then
printf '%s\n' "net.ipv6.conf.default.accept_source_route = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
sysctl -w net.ipv4.route.flush=1
if [ -n "$( grep net.ipv6.route.flush /etc/sysctl.conf )" ] || [ -n "$( grep net.ipv6.route.flush /etc/sysctl.d/*.conf )" ]; then
printf '%s\n' "net.ipv6.route.flush = 1" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
if [ -n "$( grep net.ipv6.route.flush /etc/sysctl.conf )" ] || [ -n "$( grep net.ipv6.route.flush /etc/sysctl.d/*.conf )" ]; then
sysctl -w net.ipv6.route.flush=1
fi