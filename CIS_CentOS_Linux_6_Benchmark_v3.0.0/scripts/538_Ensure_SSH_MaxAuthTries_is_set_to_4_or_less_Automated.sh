sed -i 's/MaxAuthTries \([0-9]\+\)/MaxAuthTries 4/' /etc/ssh/sshd_config
service ssh restart