echo "Setting max_log_file_action to 'keep_logs' in /etc/audit/auditd.conf" | tee -a /etc/audit/auditd.conf
cat /etc/audit/auditd.conf | grep max_log_file_action