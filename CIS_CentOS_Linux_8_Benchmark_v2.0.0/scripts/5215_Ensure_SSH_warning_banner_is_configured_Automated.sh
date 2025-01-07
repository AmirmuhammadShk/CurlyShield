sed -i '/^Banner/s/^.*$/ Banner /etc/issue.net' /etc/ssh/sshd_config
systemctl restart sshd