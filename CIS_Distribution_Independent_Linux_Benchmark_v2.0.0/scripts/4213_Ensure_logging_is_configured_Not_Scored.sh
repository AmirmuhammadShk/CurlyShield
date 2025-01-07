echo "Configuring rsyslog..."
sed -i 's/^.emerg  .*$/omusrmsg:*/' /etc/rsyslog.conf
sed -i 's/^\-.*$/\/var/log/mail/' /etc/rsyslog.conf
sed -i 's/^\-.*$/\/var/log/mail.info/' /etc/rsyslog.conf
sed -i 's/^\-.*$/\/var/log/mail.warn/' /etc/rsyslog.conf
sed -i 's/^\-.*$/\/var/log/mail.err/' /etc/rsyslog.conf
sed -i 's/^\news\.crit  .*$/\/var/log/news/news.crit/' /etc/rsyslog.conf
sed -i 's/^\news\.err  .*$/\/var/log/news/news.err/' /etc/rsyslog.conf
sed -i 's/^\news\.notice  .*$/\/var/log/news/news.notice/' /etc/rsyslog.conf
sed -i 's/^\*.=warning;^\*.=err  .*$/\/var/log/warn/' /etc/rsyslog.conf
sed -i 's/^.*crit  .*$/\/var/log/warn/' /etc/rsyslog.conf
sed -i 's/^\*.*;mail.none;news.none  .*$/\/var/log/messages/' /etc/rsyslog.conf
sed -i 's/^\local0,local1\.\*  .*$\/var/log/localmessages/' /etc/rsyslog.conf
sed -i 's/^\local2,local3\.\*  .*$\/var/log/localmessages/' /etc/rsyslog.conf
sed -i 's/^\local4,local5\.\*  .*$\/var/log/localmessages/' /etc/rsyslog.conf
sed -i 's/^\local6,local7\.\*  .*$\/var/log/localmessages/' /etc/rsyslog.conf
pkill -HUP rsyslogd