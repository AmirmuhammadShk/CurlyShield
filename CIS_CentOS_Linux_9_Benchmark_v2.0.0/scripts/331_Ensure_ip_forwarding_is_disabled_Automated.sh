sysctl -w net.ipv4.ip_forward=0
sysctl -w net.ipv4.route.flush=1
if grep -q "net.ipv6.conf.all.forwarding" /etc/sysctl.conf; then
sysctl -w net.ipv6.conf.all.forwarding=0
else
printf '%s\n' "net.ipv6.conf.all.forwarding = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
if [ "$(uname -s)" == "Linux" ]; then
sysctl -w net.ipv6.route.flush=1
else
echo "System is not Linux"
fi