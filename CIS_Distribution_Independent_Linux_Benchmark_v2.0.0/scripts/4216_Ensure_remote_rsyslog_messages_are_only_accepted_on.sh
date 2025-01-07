sed -i '/^# $ModLoad imtcp$/d' /etc/rsyslog.conf
echo "$ModLoad imtcp" >> /etc/rsyslog.conf
sed -i '/^$InputTCPServerRun 514$/d' /etc/rsyslog.conf
echo "$InputTCPServerRun 514" >> /etc/rsyslog.conf
pkill -HUP rsyslogd