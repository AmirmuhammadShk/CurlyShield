sudo yum remove squid
if dpkg -s | grep -q 'squid'; then
echo "Squid package is installed"
else
echo "Squid package is not installed"
fi