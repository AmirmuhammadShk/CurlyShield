yum remove tftp
if [ -d "/usr/bin/tftp" ]; then
echo "tftp client is still present"
else
echo "tftp client removed successfully"
fi