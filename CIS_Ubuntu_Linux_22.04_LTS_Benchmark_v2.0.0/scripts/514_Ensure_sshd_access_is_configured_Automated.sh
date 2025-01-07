Edit /etc/ssh/sshd_config file to set one or more of the parameters above any
Include and Match set statements as follows:
AllowUsers <userlist>
- AND/OR -
AllowGroups <grouplist>
if [ ! -f "/etc/ssh/sshd_config" ]; then
echo "The /etc/ssh/sshd_config file does not exist."
fi
echo "AllowUsers $1" >> /etc/ssh/sshd_config
echo "AllowGroups $2" >> /etc/ssh/sshd_config