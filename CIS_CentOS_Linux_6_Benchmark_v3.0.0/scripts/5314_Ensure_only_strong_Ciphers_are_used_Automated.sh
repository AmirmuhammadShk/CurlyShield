sed -i 's/aes128-ctr/aes256-ctr/g' /etc/ssh/sshd_config
echo "Ciphers aes256-ctr,aes192-ctr,aes128-ctr" | sed '/^Ciphers\s*$/d' >> /etc/ssh/sshd_config
systemctl restart ssh