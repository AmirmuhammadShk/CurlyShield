echo "Ciphers -3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,chacha20-poly1305@openssh.com" > /etc/ssh/sshd_config
echo "If CVE-2023-48795 has been addressed and meets local site policy, remove chacha20-poly1305@openssh.com" >> /etc/ssh/sshd_config
sed -i 's/Ciphers.*$/Ciphers chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com/' /etc/ssh/sshd_config
systemctl restart sshd