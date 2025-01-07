echo "Edit the /etc/motd file with the appropriate contents" >> /usr/log/messages
sed -i 's/\\m//g' /etc/motd
sed -i 's/\\r//g'
sed -i 's/\\s//g'
sed -i 's/\\v//g'
sed -i 's/Ubuntu|Debian|Linux//gi'
echo "Modified /etc/motd file" >> /usr/log/messages