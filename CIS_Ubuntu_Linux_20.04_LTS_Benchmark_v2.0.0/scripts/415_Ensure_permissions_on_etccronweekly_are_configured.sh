chown root:root /etc/cron.weekly/
chmod 755 /etc/cron.weekly/
[ $(id -u) -eq 0 ] && echo "Owner is root" || echo "Owner is not root"
[ $(getfacl /etc/cron.weekly/) == "drwxr-xr-x" ] && echo "/etc/cron.weekly/ has correct permissions" || echo "/etc/cron.weekly/ does not have correct permissions"
chmod 755 /etc/cron.weekly/
echo "(default, 755/drwxr-xr-x)"