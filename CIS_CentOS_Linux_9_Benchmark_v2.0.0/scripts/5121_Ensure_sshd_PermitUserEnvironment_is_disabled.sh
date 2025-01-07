sed -i '/Include / s/.*//; i PermitUserEnvironment no' /etc/ssh/sshd_config
service sshd reload