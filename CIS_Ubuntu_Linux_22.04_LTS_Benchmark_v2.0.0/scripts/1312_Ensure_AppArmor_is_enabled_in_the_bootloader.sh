sed -i 's/GRUB_CMDLINE_LINUX=".*"/GRUB_CMDLINE_linux="apparmor=1 security=apparmor"/g' /etc/default/grub
update-grub