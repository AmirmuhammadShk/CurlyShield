sudo sed -i 's/PermitUserRootLogin yes/PermitUserRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitGroupLogin yes/PermitGroupLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/MaxAuthAttempts 6/MaxAuthAttempts 3/' /etc/ssh/sshd_config
sudo service ssh restart