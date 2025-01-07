grubby --update-kernel ALL --args 'audit_backlog_limit=8192'
echo "audit_backlog_limit=8192" | grub-edit settings > /dev/null 2>&1