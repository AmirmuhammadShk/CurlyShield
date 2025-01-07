sed -i '/Ciphers/c\s*Ciphers=' /etc/ssh/sshd_config
echo "chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" >> /etc/ssh/sshd_config
sed -i 's/Include.*:||.*/\n/' /etc/ssh/sshd_config