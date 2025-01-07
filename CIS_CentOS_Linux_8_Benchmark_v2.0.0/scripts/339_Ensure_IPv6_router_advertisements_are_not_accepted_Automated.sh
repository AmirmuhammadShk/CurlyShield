if [ "$(uname -s)" == "Linux" ]; then
printf "%s\n" \
"net.ipv6.conf.all.accept_ra = 0" \
"net.ipv6.conf.default.accept_ra = 0" \
"net.ipv6.route.flush=1" >> /etc/sysctl.d/60-netipv6_sysctl.conf
echo "Running sysctl commands to set kernel parameters"
sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
sysctl -w net.ipv6.route.flush=1
fi