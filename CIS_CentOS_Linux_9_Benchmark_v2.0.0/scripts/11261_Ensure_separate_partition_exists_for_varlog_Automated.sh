dd if=/dev/zero of=/var/log partition=128M
mkfs.ext4 /var/log > /dev/null 2>&1 && echo "/var/log     ext4    defaults,failover 0 2" | sudo tee -a /etc/fstab