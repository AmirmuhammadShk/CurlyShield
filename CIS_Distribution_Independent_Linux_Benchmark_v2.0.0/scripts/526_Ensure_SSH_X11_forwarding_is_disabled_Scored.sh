sed -i 's/X11Forwarding yes/X11Forwarding no/g' /etc/ssh/sshd_config
service ssh restart