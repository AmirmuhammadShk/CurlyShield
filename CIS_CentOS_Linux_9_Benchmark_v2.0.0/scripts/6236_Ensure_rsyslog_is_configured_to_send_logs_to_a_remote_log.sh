echo "*.* action(type=\"omfwd\" target=\"loghost.example.com\" port=\"514\" protocol=\"tcp\" action.resumeRetryCount=\"100\" queue.type=\"LinkedList\" queue.size=\"1000\")" | tee -a /etc/rsyslog.conf
for file in /etc/rsyslog.d/*.conf; do
echo "*.* action(type=\"omfwd\" target=\"loghost.example.com\" port=\"514\" protocol=\"tcp\" action.resumeRetryCount=\"100\" queue.type=\"LinkedList\" queue.size=\"1000\")" >> "$file"
done
systemctl reload-or-restart rsyslog.service