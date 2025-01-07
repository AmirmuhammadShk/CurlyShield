if [ -f /etc/crontab ]; then
chown root:root /etc/crontab
chmod 644 /etc/crontab
else
echo "/etc/crontab does not exist."
fi