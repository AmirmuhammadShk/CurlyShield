AUDIT_BACKLOG_SIZE=8192
grubby --update-kernel ALL --args "audit_backlog_limit=$AUDIT_BACKLOG_SIZE"
echo "GRUB_CMDLINE_LINUX=\"quiet audit_backlog_limit=$AUDIT_BACKLOG_SIZE\"" >> /etc/default/grub