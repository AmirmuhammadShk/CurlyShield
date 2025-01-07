crontab -u root -e && echo "0 5 * * * /usr/sbin/aide --check" >> crontab || true
echo "[Unit]" > /etc/systemd/system/aidecheck.service
echo "Description=Aide Check" >> /etc/systemd/system/aidecheck.service
echo "[Service]" >> /etc/systemd/system/aidecheck.service
echo "Type=simple" >> /etc/systemd/system/aidecheck.service
echo "ExecStart=/usr/sbin/aide --check" >> /etc/systemd/system/aidecheck.service
echo "[Install]" >> /etc/systemd/system/aidecheck.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/aidecheck.service
echo "[Unit]" > /etc/systemd/system/aidecheck.timer
echo "Description=Aide check every day at 5AM" >> /etc/systemd/system/aidecheck.timer
echo "[Timer]" >> /etc/systemd/system/aidecheck.timer
echo "OnCalendar=*-*-* 05:00:00" >> /etc/systemd/system/aidecheck.timer
echo "Unit=aidecheck.service" >> /etc/systemd/system/aidecheck.timer
echo "[Install]" >> /etc/systemd/system/aidecheck.timer
echo "WantedBy=multi-user.target" >> /etc/systemd/system/aidecheck.timer
chown root:root /etc/systemd/system/aidecheck.*
chmod 0644 /etc/systemd/system/aidecheck.*
systemctl daemon-reload && systemctl enable aidecheck.timer