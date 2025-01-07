echo "PermitRootLogin no" > /etc/ssh/sshd_config
systemctl restart sshd