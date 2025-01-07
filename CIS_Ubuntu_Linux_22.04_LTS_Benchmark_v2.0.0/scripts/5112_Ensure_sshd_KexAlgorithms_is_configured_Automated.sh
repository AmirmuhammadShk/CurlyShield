echo "KexAlgorithms -diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-
hellman-group-exchange-sha1" | sudo tee /etc/ssh/sshd_config
sudo service sshd restart