for port in {1..65535}; do
protocol=$(getent protocols | cut -d ':' -f2)
echo "ip6tables -A INPUT -p $protocol --dport $port -m state --state NEW -j ACCEPT"
done