[ -f /boot/efi/EFI/*/grub.conf ] && sed -ri 's/(^\s*kernel\s+.*)$/\1 audit=1/g' /boot/efi/EFI/*/grub.conf
[ -f /boot/grub/grub.conf ] && sed -ri 's/(^\s*kernel\s+.*)$/\1 audit=1/g' /boot/grub/grub.conf