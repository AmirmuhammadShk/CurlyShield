if [ -d "/etc/cron.weekly" ]; then
# Set ownership and permissions on the /etc/cron.weekly directory
chown root:root /etc/cron.weekly
chmod 755 /etc/cron.weekly
fi