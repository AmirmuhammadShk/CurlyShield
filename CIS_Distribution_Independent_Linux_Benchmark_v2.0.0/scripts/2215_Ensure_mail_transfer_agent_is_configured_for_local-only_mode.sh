echo "inet_interfaces = loopback-only" >> /etc/postfix/main.cf
systemctl restart postfix || service postfix restart