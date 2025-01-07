log_file=$(awk -F"=" '/^\s*log_file\s*=\s*/ {print $2}' /etc/audit/auditd.conf | xargs)
find "$log_file" -type f \( ! -group adm -a ! -group root \) -exec chgrp root {} +
sed -ri 's/^\s*#?\s*log_group\s*=\s*\S+(\s*#.*)?.*$/log_group = root\1/' /etc/audit/auditd.conf
systemctl restart auditd