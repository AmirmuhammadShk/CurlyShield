if [ -f /etc/audit/auditd.conf ]; then
log_file_dir=$(awk -F "=" '/^\s*log_file/ {print $2}' /etc/audit/auditd.conf | xargs)
find "$log_file_dir" -type f -perm /0137 -exec chmod u-x,g-wx,o-rwx {} +
fi