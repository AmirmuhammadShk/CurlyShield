rsyslog-d.conf=$(cat /etc/rsyslog.conf)
if ! grep -q "FileCreateMode" <<< "$rsyslog-d.conf"; then
echo "$FileCreateMode 0640" >> /etc/rsyslog.d/$(basename /etc/rsyslog.d/)
fi
systemctl restart rsyslog