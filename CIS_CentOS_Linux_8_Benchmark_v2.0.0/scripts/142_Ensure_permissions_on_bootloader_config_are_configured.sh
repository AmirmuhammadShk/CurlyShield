if [ -f /boot/grub2/grub.cfg ]; then
chown root:root /boot/grub2/grub.cfg
chmod og-rwx /boot/grub2/grub.cfg
fi
if [ -f /boot/grub2/grubenv ]; then
chown root:root /boot/grub2/grubenv
chmod og-rwx /boot/grub2/grubenv
fi
if [ -f /boot/grub2/user.cfg ]; then
chown root:root /boot/grub2/user.cfg
chmod og-rwx /boot/grub2/user.cfg
fi
if [ "${BASH_VERSINFO[0]}" -eq 4 ]; then
# Check if the system uses UEFI (only works on Linux systems)
if [ "$(uname -s)" == "Linux" ]; then
echo "/boot/efi vfat defaults,umask=0027,fmask=0077,uid=0,gid=0 0 0" >> /etc/fstab
else
echo "Unsupported operating system"
fi
else
echo "Unsupported bash version"
fi