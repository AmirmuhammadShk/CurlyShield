printf "net.ipv4.conf.all.send_redirects = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf "net.ipv4.conf.default.send_redirects = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf "net.ipv4.route.flush=1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
sysctl -w net.ipv4.conf.all.send_redirects=0
sysctl -w net.ipv4.conf.default.send_redirects=0
sysctl -w net.ipv4.route.flush=1