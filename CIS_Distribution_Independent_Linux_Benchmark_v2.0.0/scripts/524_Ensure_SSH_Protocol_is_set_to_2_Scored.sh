sed -i 's/Protocol\s*\([0-9]\+\).*$/\1' /etc/ssh/sshd_config
systemctl restart sshd