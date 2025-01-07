printf '%s\n' "net.ipv6.conf.all.accept_ra=0" "net.ipv6.conf.default.accept_ra=0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
sysctl -w net.ipv6.route.flush=1