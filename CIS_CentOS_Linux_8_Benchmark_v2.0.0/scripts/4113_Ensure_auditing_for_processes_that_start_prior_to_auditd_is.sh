grubby --update-kernel ALL --args 'audit=1'
echo "audit=1" | grubby --set-value=GRUB_CMDLINE_LINUX '/boot/grub/grub.cfg'