if [ ! -f /etc/motd ]; then
echo "File does not exist. Skipping permissions configuration."
else
readlink -e /etc/motd | chown root:root
chmod u-x,go-wx $(readlink -e /etc/motd)
fi
if [ -f /etc/motd ]; then
rm /etc/motd
fi