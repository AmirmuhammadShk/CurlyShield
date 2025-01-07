sysctl -w net.ipv4.conf.all.accept_redirects=0
sysctl -w net.ipv4.conf.default.accept_redirects=0
if [ -x "$(command -v ipv6)" ]; then
sysctl -w net.ipv6.conf.all.accept_redirects=0
sysctl -w net.ipv6.conf.default.accept_redirects=0
fi
sysctl -w net.ipv4.route.flush=1
if [ -x "$(command -v ipv6)" ]; then
sysctl -w net.ipv6.route.flush=1
fi