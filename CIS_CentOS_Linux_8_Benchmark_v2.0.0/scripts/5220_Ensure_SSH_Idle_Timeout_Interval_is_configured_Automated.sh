sed -i 's/ClientAliveInterval *\(.*\)/ClientAliveInterval \1/' /etc/ssh/sshd_config
sed -i '/^ClientAliveCountMax$/s/\(3\)/0/' /etc/ssh/sshd_config