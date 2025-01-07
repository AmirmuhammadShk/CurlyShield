echo "inet_interfaces = loopback-only" | sudo tee -u postgres /etc/postfix/main.cf
sudo systemctl restart postfix