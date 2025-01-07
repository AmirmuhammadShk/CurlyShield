echo "Installing .conf file for hfsplus..."
vim /etc/modprobe.d/hfsplus.conf
echo "Line added: install hfsplus /bin/true"
echo "Unloading hfsplus module..."
rmmod hfsplus