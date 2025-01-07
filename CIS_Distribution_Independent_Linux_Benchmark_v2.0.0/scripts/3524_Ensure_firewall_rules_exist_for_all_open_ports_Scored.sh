for port in {1..65535}; do
protocol=${protocol[$port]}
if [ -z "$protocol" ]; then
echo "No protocol defined for port $port"
continue
fi
iptables -A INPUT -p $protocol --dport $port -m state --state NEW -j ACCEPT
done