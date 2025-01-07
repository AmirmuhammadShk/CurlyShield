for port in {1..65535}; do
if ! ip6tables -n | grep -q "tcp\|udp"; then
echo "No IPv6 rule for $port"
else
ip6tables -A INPUT -p tcp --dport $port -m state --state NEW -j ACCEPT
ip6tables -A INPUT -p udp --dport $port -m state --state NEW -j ACCEPT
fi
done