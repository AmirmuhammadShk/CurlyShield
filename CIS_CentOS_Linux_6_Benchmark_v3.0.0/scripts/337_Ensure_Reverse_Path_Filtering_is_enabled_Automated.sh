echo "Enabling Reverse Path Filtering"
sysctl -w net.ipv4.conf.all.rp_filter=1
sysctl -w net.ipv4.conf.default.rp_filter=1
sysctl -w net.ipv4.route.flush=1
echo "Reverse Path Filtering enabled."
echo "Configuring sysctl to persist across reboots:"
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.route.flush = 1" >> /etc/sysctl.conf
echo "Configuration saved to /etc/sysctl.conf"
sysctl -p