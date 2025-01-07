sed -i '/^HostbasedAuthentication$/s/no//if ! grep -q "HostbasedAuthentication no" /etc/ssh/sshd_config' /etc/ssh/sshd_config
echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config