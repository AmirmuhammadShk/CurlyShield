if [ -f /boot/grub/grub.conf ]; then
sed -ri 's/(^\s*kernel\s+.*)$/\1 audit_backlog_limit=8192/g' /boot/grub/grub.conf
fi
if [ -d /boot/efi/EFI/* ] && [ -f /boot/efi/EFI/*/grub.conf ]; then
sed -ri 's/(^\s*kernel\s+.*)$/\1 audit_backlog_limit=8192/g' /boot/efi/EFI/*/grub.conf
fi