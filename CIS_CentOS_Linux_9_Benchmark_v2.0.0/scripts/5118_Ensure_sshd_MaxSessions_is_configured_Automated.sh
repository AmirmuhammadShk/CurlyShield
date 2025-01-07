sed -i 's/[^#]*MaxSessions.*$/MaxSessions 10/' /etc/ssh/sshd_config
service sshd reload