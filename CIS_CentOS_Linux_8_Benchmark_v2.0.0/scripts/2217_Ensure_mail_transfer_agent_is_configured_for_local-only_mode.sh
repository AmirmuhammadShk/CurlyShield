sed -i 's/inet_interfaces/sinet_interfaces/' /etc/postfix/main.cf
echo "inet_interfaces = loopback-only" >> /etc/postfix/main.cf
systemctl restart postfix