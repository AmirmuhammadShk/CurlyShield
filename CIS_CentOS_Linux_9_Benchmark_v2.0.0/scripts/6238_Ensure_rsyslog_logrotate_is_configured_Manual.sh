edit_logrotate_config() {
sed -i '/rsyslog/d' /etc/logrotate.conf
cat <<EOF > /etc/logrotate.d/rsyslog
/var/log/rsyslog/*.log {
weekly
rotate 4
compress
missingok
notifempty
postrotate
/usr/bin/systemctl reload rsyslog.service >/dev/null || true
endscript
}
EOF
}
edit_logrotate_config
systemctl reload rsyslog > /dev/null