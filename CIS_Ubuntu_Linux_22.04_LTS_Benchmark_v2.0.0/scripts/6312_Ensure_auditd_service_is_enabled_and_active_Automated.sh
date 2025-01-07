setfacl -R -m user:root:allow --no-prefetch -E /sys/fs/audit/audit_rule_file
systemctl unmask auditd
systemctl enable auditd
systemctl start auditd