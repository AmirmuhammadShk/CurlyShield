echo "Edit /etc/logrotate.conf" >> /var/log/syslog
for file in /etc/logrotate.d/*; do
echo "Edit $file" >> /var/log/syslog
done