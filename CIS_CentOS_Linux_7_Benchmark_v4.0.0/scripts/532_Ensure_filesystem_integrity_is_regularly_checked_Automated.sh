crontab -u root -e
0 5 * * * /usr/sbin/aide --check
systemctl daemon-reload
systemctl enable aidecheck.service
systemctl --now enable aidecheck.timer
chown root:root /etc/systemd/system/aidecheck.*
chmod 0644 /etc/systemd/system/aidecheck.*
systemctl enable aidecheck.timer