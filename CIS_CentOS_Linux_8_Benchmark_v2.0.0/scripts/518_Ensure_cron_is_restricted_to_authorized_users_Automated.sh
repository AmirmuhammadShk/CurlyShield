if rpm -q cronie >/dev/null; then
rm -f /etc/cron.deny && touch /etc/cron.allow && chown root:root /etc/cron.allow && chmod u-x,go-rwx /etc/cron.allow
else
echo "cron is not installed on the system"
fi