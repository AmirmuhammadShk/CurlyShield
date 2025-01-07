if [ -f /boot/efi/EFI/*/grub.conf ]; then
chown root:root /boot/efi/EFI/*/grub.conf
fi
chown root:root /boot/grub/grub.conf
if [ -f /boot/efi/EFI/*/grub.conf ]; then
chmod og-rwx /boot/efi/EFI/*/grub.conf
else
chmod og-rwx /boot/grub/grub.conf
fi