if [ -d /home ]; then
echo "Partition already exists at /home"
else
mkfs -t xfs /home
fi
echo "/home  xfs  auto defaults,_netdev,0 2 2" >> /etc/fstab
if [ ! -f /etc/fstab ]; then
echo "fstab file does not exist"
else
sed -i 's/\/home.*//g' /etc/fstab
fi
if grep "/home" /etc/fstab; then
# Remove the duplicate entry for /home in fstab
sed -i '/^\/home/d' /etc/fstab
echo "/home  xfs  auto defaults,_netdev,0 2 2" >> /etc/fstab
fi
echo "Creating custom partition setup for /home"
mkpartprimary 1/3 /home
if [ ! -f /etc/fstab ]; then
echo "fstab file does not exist"
else
sed -i 's/\/home.*//g' /etc/fstab
fi