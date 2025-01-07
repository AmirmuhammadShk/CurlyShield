sudo fdisk --help | grep "Create a new" > /dev/null &&
sudo mkfs -t xfs -L varlog -F SizeXattr -o noatime,nodirectio -f /dev/sda2 || echo "Using default partition"
echo "/dev/sda2 /var/log xfs defaults,noatime,nodirectio 0 2" >> /etc/fstab