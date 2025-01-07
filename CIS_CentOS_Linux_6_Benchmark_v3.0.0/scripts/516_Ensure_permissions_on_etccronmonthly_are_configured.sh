set_cron_monthly_permissions() {
# Set ownership on /etc/cron.monthly directory
chown root:root /etc/cron.monthly
# Set permissions on /etc/cron.monthly directory to og-rwx
chmod 0644 /etc/cron.monthly
}
set_cron_monthly_permissions