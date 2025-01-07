cp ./config/aidecheck.service /etc/systemd/system/
cp ./config/aidecheck.timer /etc/systemd/system/
chmod 0644 /etc/systemd/system/aidecheck.*
systemctl reenable aidecheck.timer && systemctl restart aidecheck.timer
systemctl daemon-reload
crontab -u root -e <<EOF
0 5 * * * /usr/sbin/aide --check
EOF