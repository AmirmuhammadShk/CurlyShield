{
[ ! -e "/etc/cron.allow" ] && touch /etc/cron.allow;
chown root:root /etc/cron.allow;
chmod 640 /etc/cron.allow;
}
[ -e "/etc/cron.deny" ] && {
chown root:root /etc/cron.deny;
chmod 640 /etc/cron.deny;
}