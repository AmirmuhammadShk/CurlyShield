sed -i 's/LoginGraceTime[^ ]*/LoginGraceTime 60/' /etc/ssh/sshd_config
sed -i '/^LoginGraceTime/d' /etc/ssh/sshd_config
echo "LoginGraceTime 120" >> /etc/ssh/sshd_config