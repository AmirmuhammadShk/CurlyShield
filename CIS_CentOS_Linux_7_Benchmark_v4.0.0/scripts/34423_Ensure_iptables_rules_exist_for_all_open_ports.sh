for port in {1..65535}; do
protocol=$(echo "tcp udp" | tr ' ' '\n' | grep -i -F "<protocol>" | cut -d: -f2-)
if [ -n "$protocol" ]; then
command="iptables -A INPUT -p $protocol --dport $port -m state --state NEW -j ACCEPT"
echo "Establishing rule for port $port: $command"
fi
done