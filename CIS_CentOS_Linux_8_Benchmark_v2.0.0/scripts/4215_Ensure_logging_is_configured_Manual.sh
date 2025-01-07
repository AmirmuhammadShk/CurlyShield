echo "Updating rsyslog configuration..."
sed -i 's/omusrmsg:/omusrmsg:local0/;s/auth,authpriv\.*:/var/log/secure/' /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
sed -i "s/omusrmsg:/omusrmsg:local0/" "$file"
done
echo "Updating logging rules..."
sed -i 's/*\..*/:.*\n/' /etc/rsyslog.conf
sed -i "/^$/d" /etc/rsyslog.conf
echo "cron.* /var/log/cron" >> /etc/rsyslog.conf
echo "*.emerg omusrmsg:*" >> /etc/rsyslog.conf
echo "auth,authpriv.* /var/log/secure" >> /etc/rsyslog.conf
echo "mail.* -/var/log/mail" >> /etc/rsyslog.conf
echo "mail.info -/var/log/mail.info" >> /etc/rsyslog.conf
echo "mail.warning -/var/log/mail.warn" >> /etc/rsyslog.conf
echo "mail.err /var/log/mail.err" >> /etc/rsyslog.conf
echo "*.=warning;*.=err -/var/log/warn" >> /etc/rsyslog.conf
echo "*.crit /var/log/warn" >> /etc/rsyslog.conf
systemctl restart rsyslog