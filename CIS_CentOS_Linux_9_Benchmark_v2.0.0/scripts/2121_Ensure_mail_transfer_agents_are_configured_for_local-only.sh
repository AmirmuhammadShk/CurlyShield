sed -i '/^inet_interfaces /s/^/inet_interfaces = loopback-only/' /etc/postfix/main.cf
systemctl restart postfix