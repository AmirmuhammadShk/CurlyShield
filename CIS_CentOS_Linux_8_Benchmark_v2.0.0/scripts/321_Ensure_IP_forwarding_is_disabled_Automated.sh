sysctl -w net.ipv4.ip_forward=0
sysctl -w net.ipv4.route.flush=1
if [ -n "${net.ipv6.conf.all.forwarding}" ]; then
sysctl -w net.ipv6.conf.all.forwarding=0
sysctl -w net.ipv6.route.flush=1
fi