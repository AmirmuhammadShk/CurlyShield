sudo fdisk -c "create $((2**20)) 1 /dev/sdb1" || echo "Failed to create partition"
sudo mkfs.ext4 /dev/sdb1 || echo "Failed to format partition"
sudo addmnt /dev/sdb1 /var/tmp
echo "/dev/sdb1 /var/tmp ext4 defaults 0 2" | sudo tee -a /etc/fstab
sudo mount /dev/sdb1 /var/tmp || echo "Failed to mount partition"
sudo adduser --create-home --system --shell=/bin/bash tmp_user
sudo groupadd tmp_group
echo "/home/tmp_user" >> /etc/passwd
echo "tmp_user :1000:x:1001:tmp_group:/home/tmp_user:/bin/bash" | sudo tee -a /etc/group