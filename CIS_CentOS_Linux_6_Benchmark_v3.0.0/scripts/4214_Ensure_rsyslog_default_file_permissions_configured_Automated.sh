sudo sed -i '/^$/s/$/FileCreateMode 0640/' /etc/rsyslog.conf
for d in /etc/rsyslog.d/*.conf; do
sudo sed -i "s/^$/FileCreateMode 0640/" "$d"
done