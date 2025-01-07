sed -i 's/selinux=0\s*/selinux=1/' /boot/grub/menu.lst
sed -i 's/enforcing=0\s*/enforcing=1/' /boot/grub/menu.lst
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*quiet".*/GRUB_CMDLINE_LINUX_DEFAULT="selinux=1,enforcing=1"/' /etc/default/grub
echo "grub2-mkconfig -o /boot/grub2 grub.cfg"