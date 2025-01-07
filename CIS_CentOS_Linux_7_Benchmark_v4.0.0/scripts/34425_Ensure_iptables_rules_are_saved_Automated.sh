echo "Reviewing current running iptables configuration..."
echo "$($iptables -L)"
if [ ! -f "/etc/sysconfig/iptables" ]; then
echo "Creating /etc/sysconfig/iptables file..."
cat > /etc/sysconfig/iptables << EOF
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
DROP       all  --  loopback/8           anywhere
ACCEPT     tcp  --  anywhere             anywhere             state
ESTABLISHED
ACCEPT     udp  --  anywhere             anywhere             state
ESTABLISHED
ACCEPT     icmp --  anywhere             anywhere             state
ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh
state NEW
Chain FORWARD (policy DROP)
target     prot opt source               destination
Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere             state
NEW,ESTABLISHED
ACCEPT     udp  --  anywhere             anywhere             state
NEW,ESTABLISHED
ACCEPT     icmp --  anywhere             anywhere             state
NEW,ESTABLISHED
EOF
fi
echo "Saving firewall rules to /etc/sysconfig/iptables..."
service iptables save