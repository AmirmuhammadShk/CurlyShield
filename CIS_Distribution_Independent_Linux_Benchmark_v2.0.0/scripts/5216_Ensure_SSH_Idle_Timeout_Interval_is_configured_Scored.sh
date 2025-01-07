sed -i 's/ClientAliveInterval.*$/ClientAliveInterval 300/' /etc/ssh/sshd_config
sed -i 's/ClientAliveCountMax.*$/ClientAliveCountMax 0/' /etc/ssh/sshd_config