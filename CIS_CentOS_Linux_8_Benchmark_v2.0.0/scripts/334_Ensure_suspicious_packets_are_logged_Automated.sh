printf "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/60-netipv4_sysctl.conf
printf "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.d/60-netipv4_sysctl.conf
sysctl -w net.ipv4.conf.all.log_martians=1
sysctl -w net.ipv4.conf.default.log_martians=1
sysctl -w net.ipv4.route.flush=1