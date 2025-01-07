chown root:root /etc/cron.monthly/
chmod 755 /etc/cron.monthly/
[ -d "/etc/cron.monthly/" ] && echo "Directory set correctly" || echo "Error setting directory"
[ $(stat -c %u "/etc/cron.monthly/") -eq 0 ] && echo "User ownership is correct" || echo "Error with user ownership"
[ $(stat -c %g "/etc/cron.monthly/") -eq 0 ] && echo "Group ownership is correct" || echo "Error with group ownership"
ln -s /etc/cron.monthly/ /etc/crontab