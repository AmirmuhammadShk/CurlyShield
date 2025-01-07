sudo edit /etc/default/grub
echo "GRUB_CMDLINE_LINUX=\"ipv6.disable=1\"" >> GRUB_CMDLINE_LINUX parameters
if [ "$OSTYPE" == "msys" ]; then
# For Windows-based systems, use grub-setup instead of grub2-mkconfig
sudo grub-setup --default-grub /boot/grub/grub.cfg
elif [ "$OSTYPE" == "darwin" ]; then
# For macOS, use update-grub command with --force option
sudo update-grub --force
else
# For Linux-based systems, use grub2-mkconfig or update-grub commands as needed
sudo grub2-mkconfig -o /boot/grub2/grub.cfg || sudo update-grub
fi