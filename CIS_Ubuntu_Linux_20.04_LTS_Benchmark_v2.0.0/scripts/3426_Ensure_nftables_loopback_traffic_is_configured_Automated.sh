nft add rule inet filter input iif lo accept
[ -f /etc/sysctl.conf ] && echo "net.ipv6.loopback=1" >> /etc/sysctl.conf || true
nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop
if [ -f /etc/sysctl.conf ] && grep -q "net.ipv6.loopback=1" /etc/sysctl.conf; then
nft create rule inet filter input ip6 saddr ::1 counter drop
fi