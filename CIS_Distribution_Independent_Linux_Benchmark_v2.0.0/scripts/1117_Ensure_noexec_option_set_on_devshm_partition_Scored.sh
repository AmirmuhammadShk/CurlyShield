echo "mount -o remount,noexec /dev/shm" | sudo tee /root/remount.sh
sudo chmod +x /root/remount.sh
sudo /root/remount.sh