{
l_hbfw=""
if systemctl is-enabled firewalld.service | grep -q 'enabled'; then
echo -e "\n - FirewallD is in use on the system" && l_hbfw="fwd"
elif systemctl is-enabled nftables.service 2>/dev/null | grep -q 'enabled'; then
echo -e "\n - nftables is in use on the system \n - Recommendation is NA \n -
Remediation Complete" && l_hbfw="nft"
fi
if [ "$l_hbfw" = "fwd" ]; then
l_ipsaddr=$(nft list ruleset | awk '/filter_IN_public_deny|hook input/,/}/' | grep -P -- 'ip\saddr')
if ! nft list ruleset | awk '/hook input/,/}/' | grep -Pq -- '\H+\h+"lo"\h+accept'; then
echo -e "\n - Enabling input to accept for loopback address"
firewall-cmd --permanent --zone=trusted --add-interface=lo
firewall-cmd --reload
else
echo -e "\n - firewalld input correctly set to accept for loopback address"
if ! grep -Pq -- 'ip\saddr\h+127\.0\.0\.0\/8' <<< "$l_ipsaddr"; then
echo -e "\n - Setting IPv4 network traffic from loopback address to drop"
firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address="127.0.0.1" destination not address="127.0.0.1" drop'
firewall-cmd --reload
fi
if ! grep -Pq -- 'ip\saddr\h+\!\=\h+127\.0\.0\.1\h+ip\saddr\h+127\.0\.0\.1\h+drop' <<< "$l_ipsaddr"; then
echo -e "\n - firewalld correctly set IPv4 network traffic from loopback address to drop"
fi
fi
if grep -Pq -- '^\H*0\H*$' /sys/module/ipv6/parameters/disable; then
l_ip6saddr=$(nft list ruleset | awk '/filter_IN_public_deny|hook input/,/}/' | grep 'ip6 saddr')
if ! grep -Pq 'ip6\saddr\h+::1\h+(counter\s+\d+\s+\d+)\s*drop' <<< "$l_ip6saddr"; then
echo -e "\n - Setting IPv6 network traffic from loopback address to drop"
firewall-cmd --permanent --add-rich-rule='rule family=ipv6 source address="::1" destination not address="::1" drop'
firewall-cmd --reload
fi
if ! grep -Pq -- 'ip6\saddr\h+\!\=\h+::1\h+ip6\saddr\h+::1\h+drop' <<< "$l_ip6saddr"; then
echo -e "\n - firewalld correctly set IPv6 network traffic from loopback address to drop"
fi
fi
}