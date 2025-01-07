sed -i 's/^#ClientAliveInterval.*$/ClientAliveInterval 15/' /etc/ssh/sshd_config
sed -i 's/^#ClientAliveCountMax.*$/ClientAliveCountMax 3/' /etc/ssh/sshd_config