if [ -x /usr/bin/yum ]; then
echo "Removing telnet package..."
yum remove telnet
else
echo "Installing yum is required to run this command."
fi
echo "Telnet client removed."
if [ -x /usr/bin/yum ]; then
echo "Installing yum is required to run this command."
else
echo "Running yum install on a system that does not have yum installed."
fi