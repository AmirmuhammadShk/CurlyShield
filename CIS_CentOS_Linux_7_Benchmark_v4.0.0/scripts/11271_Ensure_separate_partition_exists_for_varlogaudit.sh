sudo fdisk -c "m; n; s /dev/sda1 1 100m;" > /dev/null
sudo mkfs.xfs /dev/sda2
echo "/dev/sda2 /var/log/audit xfs defaults 0 0" >> /etc/fstab