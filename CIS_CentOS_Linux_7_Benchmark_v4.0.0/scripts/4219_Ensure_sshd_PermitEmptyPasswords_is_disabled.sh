sed -i '/Match.*$/c\PermitEmptyPasswords no\n' /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep PermitEmptyPasswords && echo 'PermitEmptyPasswords no' >> /etc/ssh/sshd_config