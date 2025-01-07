echo "Running AIDE check via cron:"
crontab -u root -e
echo "Adding AIDE wrapper to crontab:"
0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --check
echo "Running AIDE check using systemd timer:"
chown root:root /etc/systemd/system/aidecheck.*
chmod 0644 /etc/systemd/system/aidecheck.*
systemctl daemon-reload
systemctl enable aidecheck.service
systemctl --now enable aidecheck.timer