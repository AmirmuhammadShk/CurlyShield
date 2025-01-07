sed -i '/^MaxStartups$/ s/.*//s/100/60/' /etc/ssh/sshd_config
if ! grep -q 'MaxStartups' /etc/ssh/sshd_config; then
echo "MaxStartups 10:30:60" >> /etc/ssh/sshd_config
fi