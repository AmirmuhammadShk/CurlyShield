if [ "$OSTYPE" = "msys" ]; then
# For Windows systems, enable IPv6 by default
echo "Enabling IPv6..."
ipconfig /all | findstr ^IPv6 >nul && echo True || echo False
else
# For Unix-like systems, enable IPv6 by default
echo "Enabling IPv6..."
sudo ip link set dev eth0 ipv6 addr 2001:db8:85a3:0000:0000:0202:0302:0000/64 permanent
fi
default_ipv6_status="Enabled"
echo "Current IPv6 Status:"
sudo ip link show dev eth0 | grep ipv6 > /dev/null && echo True || echo False