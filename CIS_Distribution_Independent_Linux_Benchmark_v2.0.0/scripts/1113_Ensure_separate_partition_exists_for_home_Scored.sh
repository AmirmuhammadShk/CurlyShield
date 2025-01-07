sudo parted -an --script /dev/sda -- mklabel ext4 -- set 1 "fat32" --
-- mount-point /home -- fs-type ext4 -- label "HOME"
sudo mount /dev/sda1 /home
echo "/dev/sda1 /home ext4 defaults 0 2" | sudo tee -a /etc/fstab