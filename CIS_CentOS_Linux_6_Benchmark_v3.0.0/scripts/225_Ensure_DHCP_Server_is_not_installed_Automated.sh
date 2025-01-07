yum remove dhcp
if [ $? -ne 0 ]; then
echo "DHCP server is already installed"
else
echo "DHCP server removed successfully"
fi