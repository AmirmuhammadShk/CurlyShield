sudo mkdir -p /mnt/dev/shm
sudo mount -t tmpfs /mnt/dev/shm tmpfsdefaults,rw,nosuid,nodev,noexec,relatime,size=2G 0 0
echo "/mnt/dev/shm   /dev/shm   tmpfs defaults,rw,nosuid,nodev,noexec,relatime,size=2G 0 0" | sudo tee -a /etc/fstab
sudo mount -a