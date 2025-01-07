echo "MaxAuthTries 4" >> /etc/ssh/sshd_config
echo "Include /path/to/includedir" >> /etc/ssh/sshd_config # Replace with actual includedir path
sudo systemctl restart sshd