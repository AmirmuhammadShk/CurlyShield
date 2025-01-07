Edit /etc/postfix/main.cf and add the following line to the RECEIVING MAIL section:
inet_interfaces = loopback-only
Run the following command to restart postfix:
systemctl restart postfix