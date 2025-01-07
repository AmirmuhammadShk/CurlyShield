mkdir -p /var/log/audit
touch /var/log/audit audit.log
echo "/dev/sda7 /var/log/audit ext4 defaults 0 2" >> /etc/fstab
if [ -f /etc/fstab ]; then
sed -i 's/\(.*\)/&\n\/dev/sda7 \/var\/log\/audit\/ext4 defaults 0 2/' /etc/fstab
fi
mkdir -p /var/log/audit
touch /var/log/audit audit.log
echo "/dev/sdb7 /var/log/audit ext4 defaults 0 2" >> /etc/fstab