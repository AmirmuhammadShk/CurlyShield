echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" | sudo tee /etc/sysctl.conf >> /dev/null 2>&1
if [ $? -ne 0 ]; then
echo "Failed to write to /etc/sysctl.conf" >&2
exit 1
fi
echo "net.ipv4.route.flush = 1" | sudo tee /etc/sysctl.conf >> /dev/null 2>&1
if [ $? -ne 0 ]; then
echo "Failed to write to /etc/sysctl.conf" >&2
exit 1
fi
sudo sysctl -p /etc/sysctl.conf