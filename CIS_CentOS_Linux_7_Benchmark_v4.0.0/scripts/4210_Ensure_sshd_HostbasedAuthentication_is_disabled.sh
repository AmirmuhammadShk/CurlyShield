sed -i '/^HostbasedAuthentication$/c "HostbasedAuthentication no"' /etc/ssh/sshd_config
sudo systemctl restart sshd