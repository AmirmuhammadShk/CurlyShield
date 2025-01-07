grubby --update-kernel ALL --args 'audit=1'
sed -i '/GRUB_CMDLINE/Linux/s/.*//GRUB_CMDLINE="quiet audit=1"/g' /etc/default/grub