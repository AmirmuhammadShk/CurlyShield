chown root:root /etc/cron.daily/
chmod 755 /etc/cron.daily/
echo "Ownership and permissions on /etc/cron.daily verified."
if [ $? -eq 0 ]; then
echo "Success"
else
echo "Error setting ownership and permissions."
fi