dd if=/dev/zero of=/var/tmp 1000M && mkdir /var/tmp
echo "/dev/mapper/<disk-name>-tmp /var/tmp xfs defaults,1 2" | sudo tee /etc/fstab