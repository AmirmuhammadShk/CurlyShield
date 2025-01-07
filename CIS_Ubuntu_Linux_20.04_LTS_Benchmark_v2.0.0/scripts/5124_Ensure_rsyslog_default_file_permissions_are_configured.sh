sed -i '/^# FileCreateMode/d' /etc/rsyslog.conf
sed -i 's/.*$/FileCreateMode 0640/' /etc/rsyslog.conf
systemctl restart rsyslog