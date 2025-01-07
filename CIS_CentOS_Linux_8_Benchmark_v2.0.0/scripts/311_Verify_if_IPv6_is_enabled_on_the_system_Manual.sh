grubby --update-kernel ALL --args 'ipv6.disable=1'
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.d/60-disable_ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.d/60-disable_ipv6.conf
echo "net.ipv6.route.flush=1" >> /etc/sysctl.d/60-disable_ipv6.conf
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.route.flush=1