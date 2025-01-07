echo "install cramfs /bin/false" >> /etc/modprobe.d/cramfs.conf
echo "blacklist cramfs" >> /etc/modprobe.d/cramfs.conf
modprobe -r cramfs