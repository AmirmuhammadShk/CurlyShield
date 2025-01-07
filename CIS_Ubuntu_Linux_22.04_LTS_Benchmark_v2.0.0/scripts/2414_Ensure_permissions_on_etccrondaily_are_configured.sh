if [ -d "/etc/cron.daily" ]; then
# Set ownership and permissions on /etc/cron.daily directory
chown root:root /etc/cron.daily/
chmod 755 /etc/cron.daily/
fi