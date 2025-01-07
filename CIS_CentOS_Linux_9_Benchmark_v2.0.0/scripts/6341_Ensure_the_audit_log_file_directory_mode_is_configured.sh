chmod g-w,o-rwx "$(dirname "$(awk -F= '/^\s*log_file\s*/{print $2}' "/etc/audit/auditd.conf")")"
echo "Audit log file directory mode configured."