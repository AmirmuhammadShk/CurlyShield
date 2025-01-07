sudo visudo -f /etc/sudoers
sed 's/\\!authenticate//g' -i /etc/sudoers
echo "Audit complete. Please verify the changes."