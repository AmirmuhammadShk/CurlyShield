sed -i '/^ partitions =/d' /boot/microcode.img
echo "partitions = /dev/sda2 /home ext4defaults,errors=remount-ro 0 2" >> /boot/microcode.img
mkdir -p /home && mountpoint -d /home
echo "/dev/sda2 /home ext4 defaults,errors=remount-ro 0 2" >> /etc/fstab