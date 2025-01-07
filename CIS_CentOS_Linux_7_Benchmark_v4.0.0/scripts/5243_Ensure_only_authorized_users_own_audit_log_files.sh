if [ -f /etc/audit/auditd.conf ]; then
# Find all non-root files in the log directory
find "$(dirname $(awk -F "=" '/^\s*log_file/ {print $2}' /etc/audit/auditd.conf | xargs))" -type f ! -user root
# Change ownership of files to root
xargs -I {} chown root {}
fi