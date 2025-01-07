sed -i 's/apparmor=0//g' /boot/grub/menu.lst
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*apparmor=0"//g' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX="\([^"]*\).*apparmor=0"//g' /etc/default/grub
update-grub