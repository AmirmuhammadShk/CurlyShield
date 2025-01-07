echo "Your message of the day" | sed 's/\\m//g; s/\\r//g; s/\\s//g; s/\\v//g'
if [ -f /etc/motd ]; then
rm /etc/motd
fi