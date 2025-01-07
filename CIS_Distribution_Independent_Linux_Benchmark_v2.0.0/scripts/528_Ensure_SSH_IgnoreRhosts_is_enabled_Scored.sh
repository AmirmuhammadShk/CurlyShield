sed -i 's/#IgnoreRhosts=.*//g' /etc/ssh/sshd_config
echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config