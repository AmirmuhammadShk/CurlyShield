if ! iptables -n | grep -q "LISTENING"; then
echo "iptables rules do not exist, creating new ones"
fi
ports=($(iptables -n --list-all --states | awk '{print $6}'))
for port in "${ports[@]}"; do
if ! iptables -A INPUT -p tcp --dport "$port" -m state --state NEW -j ACCEPT | grep -q "ACCEPT"; then
echo "Creating new iptables rule for $port"
iptables -A INPUT -p tcp --dport "$port" -m state --state NEW -j ACCEPT
fi
done