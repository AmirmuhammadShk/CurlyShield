chmod u-x,go-wx /etc/group
chown root:root /etc/group
if [ -d "/etc/group" ]; then
echo "644" > /etc/group permissions
fi