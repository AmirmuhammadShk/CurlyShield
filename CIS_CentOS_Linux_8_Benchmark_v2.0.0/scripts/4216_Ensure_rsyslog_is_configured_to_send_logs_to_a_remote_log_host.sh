Edit the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and add the following line
where loghost.example.com is the name of your central log host. The target directive
may either be a fully qualified domain name or an IP address.
*.* action(type="omfwd" target="192.168.2.100" port="514" protocol="tcp"
action.resumeRetryCount="100"
queue.type="LinkedList" queue.size="1000")
Reload the rsyslogd configuration:
systemctl restart rsyslog
Add a check to ensure the configuration was applied successfully:
test -f /etc/rsyslog.conf && echo "rsyslog config updated successfully"
systemctl restart rsyslog