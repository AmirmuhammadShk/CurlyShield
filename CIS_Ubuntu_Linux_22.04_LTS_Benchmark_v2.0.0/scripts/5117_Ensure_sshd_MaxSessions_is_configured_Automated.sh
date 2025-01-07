sed -i '/^MaxSessions$/c\MaxSessions 10' /etc/ssh/sshd_config
systemctl restart sshd