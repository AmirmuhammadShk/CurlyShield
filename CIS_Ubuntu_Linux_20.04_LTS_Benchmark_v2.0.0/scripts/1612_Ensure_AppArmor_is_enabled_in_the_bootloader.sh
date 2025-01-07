sed -i 's/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"/' /etc/default/grub
update-grub