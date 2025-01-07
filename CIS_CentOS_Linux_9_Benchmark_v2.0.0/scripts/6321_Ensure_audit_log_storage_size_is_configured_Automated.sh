echo "max_log_file = 8" > /etc/audit/auditd.conf
systemctl restart auditd
cat /etc/audit/auditd.conf | grep max_log_file