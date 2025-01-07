{
sysctl -w net.ipv4.ip_forward=0
sysctl -w net.ipv4.route.flush=1
}
if [ "$(uname -s)" == "Linux" ]; then
printf '%s\n' "net.ipv6.conf.all.forwarding = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
sysctl -w net.ipv6.conf.all.forwarding=0
sysctl -w net.ipv6.route.flush=1