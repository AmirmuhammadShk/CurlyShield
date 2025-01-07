rm -f /etc/cron.deny
rm -f /etc/at.deny
touch /etc/cron.allow
touch /etc/at.allow
chmod go-rwx /etc/cron.allow
chmod go-rwx /etc/at.allow
chown root:root /etc/cron.allow
chown root:root /etc/at.allow