sudo fdisk -xu /dev/sda | grep '^/' > /tmp/partition_var
echo "Create a separate partition for /var" >> /etc/logrotate.conf
echo "/dev/sda4 /var ext4 defaults 0 2" >> /etc/fstab