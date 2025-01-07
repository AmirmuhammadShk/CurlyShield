echo "Setting max log file action to keep logs"
sed -i 's/max_log_file_action=delete/max_log_file_action=keep_logs/' /etc/audit/auditd.conf
if [ $? -ne 0 ]; then
echo "Failed to update auditd.conf"
exit 1
fi