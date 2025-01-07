sed -i 's/^AllowTcpForwarding.*$/AllowTcpForwarding no/' /etc/ssh/sshd_config
service ssh restart