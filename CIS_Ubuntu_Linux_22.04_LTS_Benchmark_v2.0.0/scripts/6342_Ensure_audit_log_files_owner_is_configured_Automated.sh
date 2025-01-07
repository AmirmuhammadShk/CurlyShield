if [ -f /etc/audit/auditd.conf ]; then
# Get the directory path from the log_file parameter
dir_path=$(awk -F "=" '/^\s*log_file/ {print $2}' /etc/audit/auditd.conf | xargs)
# Find all files in the directory that are not owned by root
files=$(find "$dir_path" -type f ! -user root)
# Change ownership of found files to root
chown root $files
fi