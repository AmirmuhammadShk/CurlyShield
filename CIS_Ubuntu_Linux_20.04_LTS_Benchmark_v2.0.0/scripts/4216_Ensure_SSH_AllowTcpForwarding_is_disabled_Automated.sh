sed -i 's/yes/no/' /etc/ssh/sshd_config
sed -i '/Include/,/\/\*/ { s/allowtcpforwarding yes/no/; }' /etc/ssh/sshd_config