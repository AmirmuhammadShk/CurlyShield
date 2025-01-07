if [ "$(uname -s)" != "Linux" ]; then
echo "Error: This script is designed for Linux systems."
exit 1
fi
firewall-cmd --remove-service=cockpit
firewall-cmd --remove-port=25/tcp
firewall-cmd --runtime-to-permanent