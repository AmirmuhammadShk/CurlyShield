sed -i 's/^IgnoreRhosts=.*/IgnoreRhosts yes/' /etc/ssh/sshd_config
systemctl restart sshd