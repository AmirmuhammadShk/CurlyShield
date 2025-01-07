echo "LogLevel VERBOSE" >> /etc/ssh/sshd_config || echo "Error setting LogLevel parameter"
echo "LogLevel INFO" >> /etc/ssh/sshd_config || echo "Error setting LogLevel parameter"
systemctl restart sshd || echo "Error applying changes"