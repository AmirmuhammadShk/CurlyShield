sed -i 's/Banner *=\*.*$/Banner /=\*/g' /etc/ssh/sshd_config
service ssh restart