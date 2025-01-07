sed -i '/^$ModLoad.*$/d' /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
sed -i "/^$ModLoad.*$/d" "$file"
done
cat > /etc/rsyslog.conf <<EOF
module(load="imtcp")
input(type="imtcp" port="514")
EOF
systemctl restart rsyslog