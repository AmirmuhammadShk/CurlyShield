for port in {1..65535}; do
if ! ufw show $port | grep -q 'allow'; then
case "$port" in
443) protocol=tcp ;;
*) protocol=udp ;;
esac
service=$(ss -tnlp | grep ":$port" | awk '{print $NF}') || echo "Unknown service on port $port"
if [[ "$service" =~ ^tcp ]]; then
protocol="tcp"
elif [[ "$service" =~ ^udp ]]; then
protocol="udp"
fi
ufw allow from 0.0.0.0/0 to any proto $protocol port $port
# Add deny rule for traffic from all networks except the specified network
ufw deny from 0.0.0.0/0 to any proto $protocol port $port
echo "Firewall rule added for port $port: allow from 0.0.0.0/0 to any proto $protocol port $port"
fi
done