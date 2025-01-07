sudo sed -i 's/nosuid//; s/defaults,rw,nosuid/nodev,noexec,rw,nosuid/' /etc/fstab
sudo mount -o remount /dev/shm