sed -i '/PermitRootLogin/s/with-password/no/' /etc/ssh/sshd_config
systemctl restart sshd