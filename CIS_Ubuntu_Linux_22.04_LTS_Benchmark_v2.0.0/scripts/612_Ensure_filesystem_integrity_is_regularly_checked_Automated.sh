crontab -u root -e
0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --update
chown root:root /etc/systemd/system/aidecheck.*
chmod 0644 /etc/systemd/system/aidecheck.*
systemctl daemon-reload
systemctl enable aidecheck.service
systemctl enable aidecheck.timer
systemctl start aidecheck.timer