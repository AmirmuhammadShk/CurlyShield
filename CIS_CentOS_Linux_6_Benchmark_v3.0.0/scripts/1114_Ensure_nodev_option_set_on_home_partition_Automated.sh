echo "nodev" >> /etc/fstab | grep -q "^/home\|^\s*.*$|^.*$/home/" && echo "Edit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /home partition" || :
sudo echo "nodev" >> /etc/fstab
sudo grep -q "nodev" /etc/fstab