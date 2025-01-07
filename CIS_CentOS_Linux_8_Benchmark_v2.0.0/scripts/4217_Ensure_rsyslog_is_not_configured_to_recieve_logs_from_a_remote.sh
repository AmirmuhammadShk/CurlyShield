sed -i '/^$ModLoad/,/^$/d' /etc/rsyslog.conf
for conf in /etc/rsyslog.d/*.conf; do
sed -i "/\/input[type='imtcp'/,/\//d" "$conf"
done
systemctl restart rsyslog