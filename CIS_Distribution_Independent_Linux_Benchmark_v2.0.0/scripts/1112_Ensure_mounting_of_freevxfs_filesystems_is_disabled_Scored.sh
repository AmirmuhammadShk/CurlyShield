echo "Installing .conf file in /etc/modprobe.d/" && vim /etc/modprobe.d/freevxfs.conf
echo "Adding line 'install freevxfs /bin/true' to the file" >> /etc/modprobe.d/freevxfs.conf
echo "Unloading freevxfs module"
rmmod freevxfs