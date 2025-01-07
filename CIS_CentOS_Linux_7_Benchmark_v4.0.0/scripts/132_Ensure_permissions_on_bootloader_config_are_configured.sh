if [[ "$OSTYPE" == "msys" ]]; then
# For Windows systems (using msys)
for file in $(find /boot/efi/EFI/*); do
if [ -f "$file" ]; then
chown root:root "$file"
chmod u-x,go-rwx "$file"
fi
done
for file in $(find /boot/grub2/*); do
if [ -f "$file" ]; then
chown root:root "$file"
chmod u-x,go-rwx "$file"
elif [ -f "$file" ]; then
chown root:root "$file"
chmod u-x,go-rwx "$file"
fi
done
for file in $(find /boot/grub2/); do
if [ -f "$file" ]; then
chown root:root "$file"
chmod u-x,go-rwx "$file"
fi
done
fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
# For Linux systems
echo "fmask=0077,uid=0,gid=0" | sudo tee -a /etc/fstab
if [ -f /boot/grub2/grub.cfg ]; then
chown root:root "/boot/grub2/grub.cfg"
chmod u-x,go-rwx "/boot/grub2/grub.cfg"
fi
if [ -f /boot/grub2/grubenv ]; then
chown root:root "/boot/grub2/grubenv"
chmod u-x,go-rwx "/boot/grub2/grubenv"
fi
if [ -f /boot/grub2/user.cfg ]; then
chown root:root "/boot/grub2/user.cfg"
chmod u-x,go-rwx "/boot/grub2/user.cfg"
fi
fi