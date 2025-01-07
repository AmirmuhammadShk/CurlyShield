echo "Authorized use only. All activity may be monitored and reported." > /etc/issue.net
if [ -f /etc/motd ]; then
rm /etc/motd
fi