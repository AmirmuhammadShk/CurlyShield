grubby --update-kernel ALL --args 'audit=1'
sed -i '/GRUB_CMDLINE/Linux/s|^$/ audit=1 |' /etc/default/grub
update-grub