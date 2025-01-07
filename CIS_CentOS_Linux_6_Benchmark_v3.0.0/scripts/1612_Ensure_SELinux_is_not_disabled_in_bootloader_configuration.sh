sed -i 's/selinux=0/enforcing=1/g' /boot/grub/grub.conf
if [ -f "/boot/efi/EFI/*/grub.conf" ]; then
sed -i 's/selinux=0/enforcing=1/g' "/boot/efi/EFI/*/grub.conf"
fi