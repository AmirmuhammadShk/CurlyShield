echo "Creating separate partition for /var/log/audit"
sudo fdisk -x /dev/sda | while read line; do if [ "$line" != "/dev/sda1" ]; then echo "$line"; fi; done > temp.txt
sudo mkfs.xfs /dev/sda4  # Assuming sda4 is the partition for /var/log/audit
echo "Configuring fstab"
sudo sed -i '/^\/dev\/sda4$/d' /etc/fstab
echo "/dev/sda4 /var/log/audit xfs defaults 0 2" | sudo tee -a /etc/fstab