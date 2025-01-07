sed -i 's/LogLevel /LogLevel VERBOSE/' /etc/ssh/sshd_config
if ! grep -q "Include" /etc/ssh/sshd_config; then
sed -i '$a\nLogLevel VERBOSE' /etc/ssh/sshd_config
fi