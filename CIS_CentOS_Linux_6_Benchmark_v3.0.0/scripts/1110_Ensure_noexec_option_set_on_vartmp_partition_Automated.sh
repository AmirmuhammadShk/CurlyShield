echo "Add noexec option to /var/tmp partition" >> /var/log/changes
sudo mount -o remount,noexec /var/tmp