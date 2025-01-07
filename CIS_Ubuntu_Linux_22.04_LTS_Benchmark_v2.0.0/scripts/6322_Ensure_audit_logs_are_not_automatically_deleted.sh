sed -i 's/max_log_file_action.*=.*$/max_log_file_action = keep_logs/' /etc/audit/auditd.conf
systemctl restart auditd
echo "Audit log deletion prevention enabled."