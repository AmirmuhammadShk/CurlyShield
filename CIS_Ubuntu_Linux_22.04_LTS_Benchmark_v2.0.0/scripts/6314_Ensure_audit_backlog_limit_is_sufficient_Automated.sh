GRUB_CMDLINE_LINUX="audit_backlog_limit=8192"
update-grub
[ -z "${GRUB_CMDLINE_LINUX}" ] && GRUB_CMDLINE_LINUX="audit_backlog_limit=8192"
update-grub