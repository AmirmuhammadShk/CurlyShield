sed -i '/^\/dev\/sda1/d' /boot/fedora.cfg
echo "/dev/sda2  /var/log  ext4   defaults        0   2" >> /etc/fstab
sudo mkdir /var/log
echo "/dev/sda2  /var/log  ext4   defaults        0   2" >> /etc/fstab