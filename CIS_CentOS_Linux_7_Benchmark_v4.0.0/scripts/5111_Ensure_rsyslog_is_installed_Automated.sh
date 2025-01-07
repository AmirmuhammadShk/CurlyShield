sudo yum install -y rsyslog
sudo cp /etc/rsyslog.conf /etc/rsyslog.confBackup
sed -i 's/.*forwarder.*//g' /etc/rsyslog.conf
echo "var log_facility = 4" >> /etc/rsyslog.conf
echo "rsyslogd -c /etc/rsyslog.conf"