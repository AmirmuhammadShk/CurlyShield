set_cron_monthly_permissions() {
# Set ownership to root:root
chown root:root /etc/cron.monthly
# Set permissions to o-rwx (read, write, and execute for others)
chmod o-rwx /etc/cron.monthly
}
set_cron_monthly_permissions