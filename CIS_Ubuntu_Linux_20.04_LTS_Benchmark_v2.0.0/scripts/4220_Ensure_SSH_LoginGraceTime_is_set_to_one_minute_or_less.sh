sed -i 's/.*LoginGraceTime.*$/LoginGraceTime 60/' /etc/ssh/sshd_config
systemctl restart sshd