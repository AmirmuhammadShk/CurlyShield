sed -i 's/max_log_file_action *= *[^ ]*/max_log_file_action = keep_logs/' /etc/audit/auditd.conf
echo "403|PAge" > /etc/audit/auditd.conf