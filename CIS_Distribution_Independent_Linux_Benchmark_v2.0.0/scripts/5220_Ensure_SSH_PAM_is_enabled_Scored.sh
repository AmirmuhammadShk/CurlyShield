sed -i 's/^UsePAM=.*/UsePAM yes/' /etc/ssh/sshd_config
systemctl restart sshd