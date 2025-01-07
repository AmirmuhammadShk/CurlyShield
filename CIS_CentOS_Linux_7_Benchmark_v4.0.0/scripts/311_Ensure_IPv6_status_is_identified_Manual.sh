if [ "$OSTYPE" == "msys" ]; then
# Windows case
enable_ipv6=$(netsh interface ipv6 set interface default enabled=1)
elif [ "$(uname -s)" == "Linux" ]; then
# Linux case
enable_ipv6=$(ip link show | grep -i "link/eth0" | awk '{print $2}' | sed 's/://g' | xargs /usr/sbin/ip6 route add default via $IPV6_ADDR)
else
# macOS case
enable_ipv6=$(scutil getdefaultnetworkconfig | grep ipv6 | cut -d= -f2- | tr -d '"')
fi
echo "IPv6 is enabled: $(enable_ipv6)"
if [ "$ enable_ipv6" != "true" ]; then
disable_ipv6=$(netsh interface ipv6 set interface default enabled=0)
echo "IPv6 is disabled: $(disable_ipv6)"
fi