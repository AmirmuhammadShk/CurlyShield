echo "Editing /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files as appropriate for your environment."
sed -i 's/#.*//g' /etc/rsyslog.conf
sed -i '/^(\*|\!.*)/d' /etc/rsyslog.conf
echo "omusrmsg:*" >> /etc/rsyslog.conf
echo "auth,authpriv.* /var/log/secure" >> /etc/rsyslog.conf
echo "mail.* -/var/log/mail" >> /etc/rsyslog.conf
echo "mail.info -/var/log/mail.info" >> /etc/rsyslog.conf
echo "mail.warning -/var/log/mail.warn" >> /etc/rsyslog.conf
echo "mail.err /var/log/mail.err" >> /etc/rsyslog.conf
echo "cron.* /var/log/cron" >> /etc/rsyslog.conf
sed -i '/^*.=warning;*.=err/d' /etc/rsyslog.conf
echo "cron.crit /var/log/cron.crit" >> /etc/rsyslog.conf
echo "local0,local1.* /var/log/localmessages" >> /etc/rsyslog.conf
echo "local2,local3.* /var/log/localmessages" >> /etc/rsyslog.conf
echo "local4,local5.* /var/log/localmessages" >> /etc/rsyslog.conf
echo "local6,local7.* /var/log/localmessages" >> /etc/rsyslog.conf
systemctl restart rsyslog