sudo nano /etc/logrotate.conf
sudo nano /etc/logrotate.d/*
echo "logs /var/log/* {
daily
missingok 5
notifempty
delaycompress
compress
maxsize 10M
}" >> /etc/logrotate.d/logs
sudo service logrotate restart