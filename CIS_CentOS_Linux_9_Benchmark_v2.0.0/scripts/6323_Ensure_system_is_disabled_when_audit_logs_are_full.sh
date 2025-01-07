set_disk_full_action="halt"
set_disk_error_action="halt"
echo "disk_full_action = $set_disk_full_action" >> /etc/audit/auditd.conf
echo "disk_error_action = $set_disk_error_action" >> /etc/audit/auditd.conf