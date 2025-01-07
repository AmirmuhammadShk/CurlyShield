sed -i '/^$/{s/^\(.*\).*$/\1 @@loghost.example.com/' /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
sed -i 's/#*.*//g' "$file"
sed -i '$a *.* @loghost.example.com' "$file"
done
pkill -HUP rsyslogd