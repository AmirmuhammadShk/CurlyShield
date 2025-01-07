sed -i '/Include\/etc/ssh/ssh_config.d/*.conf/d' /etc/ssh/sshd_config
echo "X11Forwarding no" >> /etc/ssh/sshd_config