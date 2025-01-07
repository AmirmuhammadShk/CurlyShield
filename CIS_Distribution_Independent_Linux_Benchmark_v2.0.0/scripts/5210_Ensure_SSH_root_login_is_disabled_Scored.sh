echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "PermitRootLogin without-password" > /etc/ssh/sshd_config
service sshd reload