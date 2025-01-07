set_icmp_echo_ignore_broadcasts() {
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" > /etc/sysctl.conf
}
flush_route_table() {
echo "net.ipv4.route.flush = 1" > /etc/sysctl.conf
}
main() {
set_icmp_echo_ignore_broadcasts
flush_route_table
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sysctl -w net.ipv4.route.flush=1
}
main