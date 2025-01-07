echo "MACs -hmac-md5,hmac-md5-96,hmac-ripemd160,hmac-sha1-96,umac-64@openssh.com,hmac-md5-etm@openssh.com,hmac-md5-96-etm@openssh.com,hmac-ripemd160-etm@openssh.com,hmac-sha1-96-etm@openssh.com,umac-64-etm@openssh.com,umac-128-etm@openssh.com" | sudo tee -a /etc/ssh/sshd_config
echo "MACs -hmac-sha1-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com" | sudo tee -a /etc/ssh/sshd_config
echo "MACs umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1" | sudo tee -a /etc/ssh/sshd_config
echo "MACs umac-64-etm@openssh.com: mailto:umac-64-etm@openssh.com
MACs umac-128-etm@openssh.com: mailto:umac-128-etm@openssh.com
MACs hmac-sha1-etm@openssh.com: mailto:hmac-sha1-etm@openssh.com
MACs hmac-sha2-256-etm@openssh.com: mailto:hmac-sha2-256-etm@openssh.com
MACs hmac-sha2-512-etm@openssh.com: mailto:hmac-sha2-512-etm@openssh.com" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl reload sshd