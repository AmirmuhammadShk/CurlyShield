for port in $(echo "1-65535" | tr ' ' '\n' | sed '/^$/d'); do
for protocol in tcp udp; do
command="iptables -A INPUT -p $protocol --dport $port -m state --state NEW -j ACCEPT"
echo "$command"
done
done