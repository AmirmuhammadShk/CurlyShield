echo "Editing /etc/ssh/sshd_config to set the ClientAliveInterval and ClientAliveCountMax parameters..." >&2
sed -i 's/#.*$/ClientAliveInterval 15 \n# Comment out or remove\nClientAliveCountMax 3/' /etc/ssh/sshd_config
if [ $? -ne 0 ]; then
echo "Failed to edit /etc/ssh/sshd_config" >&2
exit 1
fi