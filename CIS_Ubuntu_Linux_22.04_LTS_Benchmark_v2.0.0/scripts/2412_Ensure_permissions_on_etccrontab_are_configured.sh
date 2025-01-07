if [ -f /etc/crontab ]; then
chown root:root /etc/crontab
chmod go-rwx /etc/crontab
fi