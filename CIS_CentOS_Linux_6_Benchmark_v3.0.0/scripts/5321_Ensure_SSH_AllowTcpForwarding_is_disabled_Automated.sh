sed -i 's/\(AllowTcpForwarding\)=yes\(.*\)/\1=no/' /etc/ssh/sshd_config
sudo systemctl reload sshd