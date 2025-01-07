sed -i 's/ForwardToSyslog=yes/ForwardToSyslog=no/g' /etc/systemd/journald.conf
find /etc/systemd/journald.conf.d/ -type f -name "*.conf" | xargs sed -i 's/ForwardToSyslog=yes/ForwardToSyslog=no/g'
systemctl restart systemd-journald