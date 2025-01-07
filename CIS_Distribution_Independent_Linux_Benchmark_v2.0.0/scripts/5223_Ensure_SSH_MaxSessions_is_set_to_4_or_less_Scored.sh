echo "Updating SSH configuration..."
sed -i 's/^MaxSessions.*$/MaxSessions 4/' /etc/ssh/sshd_config
echo "Verifying changes..."
service ssh restart
echo "SSH MaxSessions set to 4"