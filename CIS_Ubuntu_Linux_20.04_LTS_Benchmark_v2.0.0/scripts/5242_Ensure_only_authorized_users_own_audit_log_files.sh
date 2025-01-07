if [ -f /etc/audit/auditd.conf ]; then
# Get the log file path from audit configuration
log_file=$(awk -F "=" '/^\s*log_file/ {print $2}' /etc/audit/auditd.conf | xargs)
# Find and set ownership of log files to root only
find "$(dirname $log_file)" -type f ! -user root -exec chown root {} +
fi