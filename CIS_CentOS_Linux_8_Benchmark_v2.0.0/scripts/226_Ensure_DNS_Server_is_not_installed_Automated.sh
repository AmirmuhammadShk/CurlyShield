dnf remove bind
if [ -d "/etc/named" ]; then
echo "DNS server is already installed"
else
echo "DNS server is not installed"
fi
for service in /etc/systemd/system/*; do
if [[ $service =~ ^libnss* ]]; then
echo "Another DNS server is installed: $service"
fi
done