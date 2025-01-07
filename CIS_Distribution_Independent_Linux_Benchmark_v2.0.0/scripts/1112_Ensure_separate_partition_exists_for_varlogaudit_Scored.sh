sudo mkpart /dev/sda2 1 100% || exit 1
echo "/dev/sda2 /var/log/audit ext4 defaults 0 2" | sudo tee -a /etc/fstab || exit 1