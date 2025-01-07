pwconv -p /etc/shadow < /etc/passwd
rm /etc/passwd
echo "This script has completed."