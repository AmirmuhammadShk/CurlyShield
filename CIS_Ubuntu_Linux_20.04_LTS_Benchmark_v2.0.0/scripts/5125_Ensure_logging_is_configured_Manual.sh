sed -i '/emerg/ s/omusrmsg:/omsudo/' /etc/rsyslog.conf
sed -i '/auth,authpriv.* /s^/var/log/secure \//m' /etc/rsyslog.d/*.conf
sed -i '/mail.* /s^-/-/m' /etc/rsyslog.d/*.conf
sed -i '/mail.info /s^/-\///m' /etc/rsyslog.d/*.conf
sed -i '/mail.warning /s^/-/-/m' /etc/rsyslog.d/*.conf
sed -i '/mail.err /s^/-\-\/var\/log\/mail.err \//m' /etc/rsyslog.d/*.conf
sed -i '/cron.* /s^\/var\/log\/cron \//m' /etc/rsyslog.d/*.conf
sed -i '/\=.warning;=\.err /s^-/-/m' /etc/rsyslog.d/*.conf
sed -i '/\.crit /s^/-\-\/var\/log\/warn \//m' /etc/rsyslog.d/*.conf
sed -i '/\*.*;mail.none;news.none /s^-/-\/var\/log\/messages \//m' /etc/rsyslog.d/*.conf
sed -i '/local0,local1.* /s^\-\-\/var\/log\/localmessages \//m' /etc/rsyslog.d/*.conf
sed -i '/local2,local3.* /s^\-\-\/var\/log\/localmessages \//m' /etc/rsyslog.d/*.conf
sed -i '/local4,local5.* /s^\-\-\/var\/log\/localmessages \//m' /etc/rsyslog.d/*.conf
sed -i '/local6,local7.* /s^\-\-\/var\/log\/localmessages \//m' /etc/rsyslog.d/*.conf
systemctl restart rsyslog