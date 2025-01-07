echo "*.* @@loghost.example.com" >> /etc/rsyslog.conf
pkill -HUP rsyslogd