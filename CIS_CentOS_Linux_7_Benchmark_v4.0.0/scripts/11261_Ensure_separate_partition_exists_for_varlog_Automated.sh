echo "Creating custom partition setup for /var/log"
if [ -n "$1" ]; then
echo "Updating fstab for /var/log"
grep -q '/var/log' /etc/fstab || echo "/var/log  ext4 defaults 0 2" >> /etc/fstab
fi