echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config
service ssh restart
echo "# PermitUserEnvironment disabled" >> /etc/ssh/sshd_config