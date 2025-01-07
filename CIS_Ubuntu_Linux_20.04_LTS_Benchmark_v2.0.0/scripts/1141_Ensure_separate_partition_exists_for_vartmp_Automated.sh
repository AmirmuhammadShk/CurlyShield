if [ ! -d /var/tmp ]; then
mkdir -p /var/tmp
fi
echo "/dev/sda5 /var/tmp ext4 defaults 0 2" >> /etc/fstab