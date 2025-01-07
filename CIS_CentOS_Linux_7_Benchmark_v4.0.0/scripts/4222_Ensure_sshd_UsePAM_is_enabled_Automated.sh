echo "UsePAM yes" > /etc/ssh/sshd_config
service ssh restart
grep -q "UsePAM yes" /etc/ssh/sshd_config