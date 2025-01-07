if [ -d "/etc/cron.monthly" ]; then
chown root:root /etc/cron.monthly
chmod 755 /etc/cron.monthly
else
echo "Error: /etc/cron.monthly does not exist"
exit 1
fi