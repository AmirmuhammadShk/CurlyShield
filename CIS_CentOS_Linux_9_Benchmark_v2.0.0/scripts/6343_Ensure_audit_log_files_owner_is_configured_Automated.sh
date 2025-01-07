if [ -f /etc/audit/auditd.conf ]; then
# Get the directory path of the log file
dir_path=$(awk -F "=" '/^\s*log_file/ {print $2}' /etc/audit/auditd.conf | xargs)
# Find all files in the directory that are not owned by root
if find "$dir_path" -type f ! -user root; then
# Change ownership of all found files to root
chown root *
fi
fi