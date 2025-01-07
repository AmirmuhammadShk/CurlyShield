sed -i 's/inet_interfaces.*$/inet_interfaces = loopback-only/' /etc/postfix/main.cf
systemctl restart postfix