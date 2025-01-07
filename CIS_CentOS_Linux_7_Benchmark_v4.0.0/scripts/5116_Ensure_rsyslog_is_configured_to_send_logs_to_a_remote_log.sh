sed -i 's/.*target=.*/target="loghost.example.com"/' /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
sed -i "s/.*action.type=.*/action.type='omfwd'/; s/.*target=.*/target=\"loghost.example.com\"/" "$file"
done
systemctl restart rsyslog