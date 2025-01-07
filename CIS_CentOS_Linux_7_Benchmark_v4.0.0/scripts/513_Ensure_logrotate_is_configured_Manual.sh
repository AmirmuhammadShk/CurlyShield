if ! grep -q "logrotate" /etc/logrotate.conf; then
# Add configuration for logrotate
echo "/etc/logrotate.d/* {
missingok = 1
skipemptyspace = false
maxsize = 100M
minage = 28
maxage = 180
}" >> /etc/logrotate.conf
fi
while IFS= read -r file; do
echo "Rotating $file..."
find "$file" -type f -mtime +28 -exec rotate "$file" {} \;
done < /etc/logrotate.d/*
find /var/log -type f -mtime +7 -exec rotate "/var/log/{}" {} \;