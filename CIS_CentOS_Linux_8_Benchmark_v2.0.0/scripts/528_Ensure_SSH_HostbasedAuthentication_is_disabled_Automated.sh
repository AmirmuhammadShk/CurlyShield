sed -i 's/HostbasedAuthentication .*/HostbasedAuthentication no/' /etc/ssh/sshd_config
chown root:root /etc/ssh/sshd_config
chmod 0644 /etc/ssh/sshd_config