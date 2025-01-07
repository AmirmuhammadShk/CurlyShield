sudo mkfs.xfs /dev/mnt tmpfs
sudo mount -t tmpfs /var/tmp /mnt -o size=10M
echo "/dev/mnt /var/tmp xfs defaults 0 2" | sudo tee /etc/fstab
sudo update-rc default tmpfs