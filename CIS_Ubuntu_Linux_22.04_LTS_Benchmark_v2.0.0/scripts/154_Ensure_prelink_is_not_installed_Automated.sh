if ! dpkg -s prelink &> /dev/null; then
echo "Uninstalling prelink, since it's not installed"
apt purge prelink
fi
echo "Restoring binaries to normal with prelink restored"
if [ "$OSTYPE" = "msys" ]; then
prelink -ua
else
# Add equivalent command for other OS types (e.g., Linux)
echo "Running equivalent command on $OSTYPE"
fi