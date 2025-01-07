printf "net.ipv4.conf.all.rp_filter = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf "net.ipv4.conf.default.rp_filter = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
sysctl -w net.ipv4.conf.all.rp_filter=1
sysctl -w net.ipv4.conf.default.rp_filter=1
sysctl -w net.ipv4.route.flush=1