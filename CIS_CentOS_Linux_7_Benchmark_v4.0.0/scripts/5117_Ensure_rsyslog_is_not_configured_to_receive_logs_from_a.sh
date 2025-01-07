sed -i '/^module\s+\(load="imtcp"\)/d' /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
sed -i '/^module\s+\(load="imtcp"\)/d' "$file"
done
sudo systemctl restart rsyslog