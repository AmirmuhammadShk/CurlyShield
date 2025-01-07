echo "Updating /etc/fstab to add nosuid option for /dev/shm"
echo '/dev/shm  nosuid' | sudo tee -a /etc/fstab
echo "Remounting /dev/shm with new options"
sudo mount -o remount /dev/shm