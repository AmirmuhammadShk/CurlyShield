sudo edit /etc/default/grub
echo "audit=1" >> GRUB_CMDLINE_LINUX
sudo update-grub