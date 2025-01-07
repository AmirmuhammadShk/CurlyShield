echo "Current running iptables configuration:"
ip6tables -L
service ip6tables save
echo "Firewall rules saved to /etc/sysconfig/ip6table"