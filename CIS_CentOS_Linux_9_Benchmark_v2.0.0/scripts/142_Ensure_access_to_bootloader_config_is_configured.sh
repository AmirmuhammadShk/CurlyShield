if [ -d /boot/efi/EFI ]; then
# Add fmask=0077, uid=0, and gid=0 options to /etc/fstab
echo "<device> /boot/efi vfat defaults,umask=0027,fmask=0077,uid=0,gid=0 0 0" >> /etc/fstab
# Update grub configuration files for UEFI systems
chown root:root /boot/efi/EFI/* && chmod u-x,go-rwx /boot/efi/EFI/*
fi
if [ -d /boot/grub2 ]; then
# Set ownership and permissions on grub configuration files
if [ -f /boot/grub2/grub.cfg ]; then chown root:root /boot/grub2/grub.cfg && chmod u-x,go-rwx /boot/grub2/grub.cfg; fi
if [ -f /boot/grub2/grubenv ]; then chown root:root /boot/grub2/grubenv && chmod u-x,go-rwx /boot/grub2/grubenv; fi
if [ -f /boot/grub2/user.cfg ]; then chown root:root /boot/grub2/user.cfg && chmod u-x,go-rwx /boot/grub2/user.cfg; fi
fi