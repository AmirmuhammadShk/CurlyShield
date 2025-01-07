if [ ! -d "/mnt/shm" ]; then
# If not, create it and mount tmpfs to it with nodev option
sudo mkdir -p /mnt/shm
echo "tmpfs /mnt/shm tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" | sudo tee -a /etc/fstab
fi
sudo mount -o remount /dev/shm