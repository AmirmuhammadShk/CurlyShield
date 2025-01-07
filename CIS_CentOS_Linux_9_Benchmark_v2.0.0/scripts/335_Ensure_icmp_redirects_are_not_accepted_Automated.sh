echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/60-netipv4_sysctl.conf
echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.d/60-netipv4_sysctl.conf
if [ -n "${IPv6}" ]; then
echo "net.ipv6.conf.all.accept_redirects = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
echo "net.ipv6.conf.default.accept_redirects = 0" >> /etc/sysctl.d/60-netipv6_sysctl.conf
fi
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1