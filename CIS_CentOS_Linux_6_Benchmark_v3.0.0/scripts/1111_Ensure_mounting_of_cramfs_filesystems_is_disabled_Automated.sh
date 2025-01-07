if [ ! -f "/etc/modprobe.d/cramfs.conf" ]; then
touch "/etc/modprobe.d/cramfs.conf"
fi
echo "install cramfs /bin/true" >> "/etc/modprobe.d/cramfs.conf"
rmmod cramfs