GRUB_CMDLINE_LINUX="audit_backlog_limit=8192"
update-grub
if [ -z "$GRUB_CMDLINE_LINUX" ]; then
GRUB_CMDLINE_LINUX="audit_backlog_limit=64"
fi