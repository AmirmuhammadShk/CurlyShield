echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256" | sudo tee -e '/etc/ssh/sshd_config'
sudo systemctl restart sshd