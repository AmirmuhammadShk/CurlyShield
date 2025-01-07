printf '%s\n' "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.conf
printf '%s\n' "net.ipv4.route.flush = 1" >> /etc/sysctl.conf
sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1
sysctl -w net.ipv4.route.flush=1