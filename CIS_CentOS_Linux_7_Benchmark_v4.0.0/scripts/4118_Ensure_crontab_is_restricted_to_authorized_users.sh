if [ ! -e "/etc/cron.allow" ]; then touch /etc/cron.allow; fi
chown root:root /etc/cron.allow
chmod u-x,g-wx,o-rwx /etc/cron.allow
if [ -e "/etc/cron.deny" ]; then
chown root:root /etc/cron.deny
chmod u-x,g-wx,o-rwx /etc/cron.deny
fi