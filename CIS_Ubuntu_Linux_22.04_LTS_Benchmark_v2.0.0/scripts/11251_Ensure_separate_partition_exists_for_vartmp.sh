if ! grep -q "/var/tmp" /etc/fstab; then
# Create new partition
sudo fdisk -u /dev/sda -m 1 | sudo mkswap -f /dev/sda1
echo '/dev/sda1 /tmp tmpfs defaults,noatime,strictmount 0 2' >> /etc/fstab
fi