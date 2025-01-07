if [ -f "/etc/motd" ]; then
rm "/etc/motd"
fi
echo "Your site's message of the day message here" > /etc/motd