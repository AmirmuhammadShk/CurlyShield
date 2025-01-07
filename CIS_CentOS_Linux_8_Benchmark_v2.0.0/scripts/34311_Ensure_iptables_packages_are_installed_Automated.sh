dnf install -y iptables iptables-services
systemctl restart firewalld
systemctl enable firewalld