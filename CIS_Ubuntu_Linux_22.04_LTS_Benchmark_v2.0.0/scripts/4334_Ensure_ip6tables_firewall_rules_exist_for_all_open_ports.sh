for port in {1..65535}; do
protocol=$(ip6tables -L -n | grep ":${port}/tcp" | cut -d' ' -f3)
if [ -z "$protocol" ]; then
protocol=$(ip6tables -L -n | grep ":${port}/udp" | cut -d' ' -f3)
fi
ip6tables -A INPUT -p $protocol --dport $port -m state --state NEW -j ACCEPT
done