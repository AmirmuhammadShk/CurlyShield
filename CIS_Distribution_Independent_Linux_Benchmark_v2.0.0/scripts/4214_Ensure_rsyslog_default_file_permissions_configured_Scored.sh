find /etc/rsyslog.conf -type f -exec chmod 0640 {} \; \
&& find /etc/rsyslog.d/*.conf -type f -exec chmod 0640 {} \;