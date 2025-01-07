sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
systemctl restart sshd
grep PermitEmptyPasswords /etc/ssh/sshd_config