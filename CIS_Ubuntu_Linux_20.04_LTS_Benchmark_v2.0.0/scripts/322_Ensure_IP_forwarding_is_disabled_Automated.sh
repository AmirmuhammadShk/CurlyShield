if [ -f /etc/sysctl.conf ]; then
printf "net.ipv4.ip_forward = 0\n" >> /etc/sysctl.conf
elif [ -d /etc/sysctl.d/ ]; then
printf "net.ipv4.ip_forward = 0\n" > /etc/sysctl.d/99-netipv4_sysctl.conf
fi
sysctl -w net.ipv4.ip_forward=0
sysctl -w net.ipv4.route.flush=1
if [ -f /etc/sysctl.conf ]; then
printf "net.ipv6.conf.all.forwarding = 0\n" >> /etc/sysctl.conf
elif [ -d /etc/sysctl.d/ ]; then
printf "net.ipv6.conf.all.forwarding = 0\n" > /etc/sysctl.d/99-netipv6_sysctl.conf
fi
sysctl -w net.ipv6.conf.all.forwarding=0
sysctl -w net.ipv6.route.flush=1