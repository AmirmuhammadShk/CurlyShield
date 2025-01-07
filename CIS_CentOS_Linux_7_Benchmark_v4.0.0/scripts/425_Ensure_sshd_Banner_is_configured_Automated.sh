echo "Updating /etc/ssh/sshd_config to include a banner" >> /var/log/ssh_config_update.log
sed -i '/^Banner.*$/c \n\ Banner /etc/issue.net' /etc/ssh/sshd_config
echo "SSH banner update complete"