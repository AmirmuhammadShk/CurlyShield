sudo fdisk -c "m" /dev/sda  # for Linux systems only
sudo mkswap /dev/sda1  # assuming /var is on sda1
sudo swapon /dev/sda1
sudo mkdir /var
sudo mount /dev/sda1 /var
echo "/dev/sda1 swap defaults 0 0" | sudo tee -a /etc/fstab