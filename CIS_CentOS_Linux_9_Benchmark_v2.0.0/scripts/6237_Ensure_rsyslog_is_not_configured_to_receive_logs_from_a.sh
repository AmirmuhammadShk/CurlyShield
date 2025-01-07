sed -i '/^\$/d' /etc/rsyslog.conf
sed -i 's/#.*//g' /etc/rsyslog.conf
sed -i 's/\$ModLoad imtcp//g' /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
sed -i '/^\$/d' "$file"
sed -i 's/#.*//g' "$file"
sed -i 's/\$ModLoad imtcp//g' "$file"
done
systemctl restart rsyslog