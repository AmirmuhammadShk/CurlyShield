sed -i 's/MaxAuthTries\s\+\([0-9]\)\.\([0-9]\)\s*\)/MaxAuthTries $1/' /etc/ssh/sshd_config
if ! grep -q "MaxAuthTries" /etc/ssh/sshd_config; then
echo 'MaxAuthTries 4' >> /etc/ssh/sshd_config
fi