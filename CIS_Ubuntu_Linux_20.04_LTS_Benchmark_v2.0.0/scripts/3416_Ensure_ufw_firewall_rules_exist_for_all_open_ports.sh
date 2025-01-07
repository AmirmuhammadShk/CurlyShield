for port in $(netstat -tlnp | awk '/LISTEN/ {print $4}' | sort -nu); do
if ! ufw rule show --port $port; then
case $port in
22) protocol=tcp ;;
443) protocol=udp ;;
*) protocol=tcp ;;
esac
ufw allow from 0.0.0.0/0 to $port:$protocol ;;
fi
done
ufw deny in any
if [ -f "/path/to/local/site/policy" ]; then
ufw allow from $(cat /path/to/local/site/policy) to any
fi