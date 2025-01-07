if [ -d "/etc/cron.d" ]; then
# Set ownership to root:root
chown root:root /etc/cron.d/
# Set permissions to drwxr-xr-x (755)
chmod 0755 /etc/cron.d/
fi