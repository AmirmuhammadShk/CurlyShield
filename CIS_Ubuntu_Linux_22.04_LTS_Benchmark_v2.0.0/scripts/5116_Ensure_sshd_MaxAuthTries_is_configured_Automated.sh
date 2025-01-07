sed -i 's/^\(MaxAuthTries\).*/\1 4/' /etc/ssh/sshd_config
sudo systemctl restart sshd