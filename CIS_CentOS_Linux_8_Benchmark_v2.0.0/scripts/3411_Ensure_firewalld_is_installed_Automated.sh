dnf install firewalld iptables
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-rich-rule="rule family=v4 protocol=tcp port=22 protocol=tcp dport=22 accept"
firewall-cmd --reload
firewall-cmd --permanent --zone=public --add-rule rule_family=ipv4 proto=all dport=* accept
firewall-cmd --reload