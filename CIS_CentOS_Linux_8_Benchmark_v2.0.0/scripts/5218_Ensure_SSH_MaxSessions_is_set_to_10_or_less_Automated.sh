sed -i 's/^\(MaxSessions\).*/\1 10/' /etc/ssh/sshd_config
service ssh restart