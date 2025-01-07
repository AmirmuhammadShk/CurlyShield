sudo mkdir -p /var/tmp
sudo mount /dev/sda5 /var/tmp  # replace /dev/sda5 with the actual device name
sudo echo "/dev/sda5 /var/tmp xfs defaults 0 2" | sudo tee -a /etc/fstab
sudo grep "^/dev/sd[a-zA-Z]* /var/tmp" /etc/fstab || {
sudo echo "/dev/sda5 /var/tmp xfs defaults 0 2" | sudo tee -a /etc/fstab
}
echo "Created separate partition for /var/tmp and configured fstab"
# This command doesn't seem to be needed after the new configuration