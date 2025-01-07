sed -i 's/MaxStartups.*$/MaxStartups 10:30:60/' /etc/ssh/sshd_config
sed -i '/Include/i s/MaxStartups.*$/MaxStartups 10:30:60/' /etc/ssh/sshd_config