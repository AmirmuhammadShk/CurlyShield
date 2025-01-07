rm -f /etc/cron.deny
touch /etc/cron.allow
chown root:root /etc/cron.allow
chmod u-x,og-rwx /etc/cron.allow