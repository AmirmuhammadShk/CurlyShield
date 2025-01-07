crontab -u root -e
echo "0 5 * * *" >> /etc/crontabs/root
echo "/usr/sbin/aide --check" >> /etc/crontabs/root