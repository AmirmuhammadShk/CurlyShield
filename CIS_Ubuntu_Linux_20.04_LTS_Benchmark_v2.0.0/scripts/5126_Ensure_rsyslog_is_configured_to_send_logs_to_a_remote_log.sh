echo "*.* $ActionName omfwd" >> /etc/rsyslog.conf
echo "  ( target = \"loghost.example.com\" port = 514 protocol = tcp )" >> /etc/rsyslog.conf
echo "> /etc/rsyslog.d/local.conf" >> /etc/rsyslog.d/
echo "action(type=\"omfwd\") { target=\"192.168.2.100\" port=\"514\" protocol=\"tcp\" action.resumeRetryCount=100 queue.type=\"LinkedList\" queue.size=1000;}" >> /etc/rsyslog.d/local.conf
systemctl restart rsyslog