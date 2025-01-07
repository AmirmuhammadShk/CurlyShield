sed -i 's/#AllowUsers.*$/AllowUsers <userlist>/' /etc/ssh/sshd_config
sed -i 's/#AllowGroups.*$/AllowGroups <grouplist>/' /etc/ssh/sshd_config
echo "Include /path/to/include/directory" >> /etc/ssh/sshd_config
echo "Match User <userlist>" >> /etc/ssh/sshd_config
echo "Match Group <grouplist>" >> /etc/ssh/sshd_config
service sshd reload