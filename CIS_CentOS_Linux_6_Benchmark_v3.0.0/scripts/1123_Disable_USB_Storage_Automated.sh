mkdir -p /etc/modprobe.d/
touch /etc/modprobe.d/usb_storage.conf
echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
rmmod usb-storage