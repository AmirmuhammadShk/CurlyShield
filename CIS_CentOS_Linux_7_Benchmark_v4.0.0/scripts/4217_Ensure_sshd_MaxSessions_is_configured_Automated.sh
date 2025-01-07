sed -i '/^#maxsessions$/s/#MaxSessions 10/MaxSessions 10' /etc/ssh/sshd_config
grep 'MaxSessions' /etc/ssh/sshd_config