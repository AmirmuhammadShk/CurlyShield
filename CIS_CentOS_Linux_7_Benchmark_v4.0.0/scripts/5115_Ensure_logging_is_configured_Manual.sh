sed -i 's/omusrmsg:/omusrmsg:/g' /etc/rsyslog.conf
sed -i 's/auth,authpriv\./var/log/secure/g' /etc/rsyslog.conf
sed -i 's mail.*:-/var/log/mail/g' /etc/rsyslog.conf
sed -i 's mail.info:-/var/log/mail.info/g' /etc/rsyslog.conf
sed -i 's mail.warning:-/var/log/mail.warn/g' /etc/rsyslog.conf
sed -i 's mail.err:/var/log/mail.err/g' /etc/rsyslog.conf
sed -i 's cron\./var/log/cron/g' /etc/rsyslog.conf
sed -i 's \*=warning;.*=err:-/var/log/warn/g' /etc/rsyslog.conf
sed -i 's \*=crit:/var/log/warn/g' /etc/rsyslog.conf
sed -i 's \*.*;mail.none;news.none:-/var/log/messages/g' /etc/rsyslog.conf
sed -i 's local0,local1\.*:var/log/localmessages/g' /etc/rsyslog.conf
sed -i 's local2,local3\.*:var/log/localmessages/g' /etc/rsyslog.conf
sed -i 's local4,local5\.*:var/log/localmessages/g' /etc/rsyslog.conf
sed -i 's local6,local7\.*:var/log/localmessages/g' /etc/rsyslog.conf
systemctl restart rsyslog