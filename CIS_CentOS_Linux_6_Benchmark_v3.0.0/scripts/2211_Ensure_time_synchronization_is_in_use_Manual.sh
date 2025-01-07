if ! yum install -y chrony; then
echo "Error: chrony installation failed"
exit 1
fi
if ! yum install -y ntp; then
echo "Error: ntp installation failed"
exit 1
fi
if [ "$(uname)" == "Darwin" ]; then
# On MacOS, use systemctl instead of systemctl (not implemented yet)
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
if [ "${chrony}" = true ]; then
systemctl enable chronyd
systemctl start chronyd
else
systemctl enable ntpd
systemctl start ntpd
fi
else
echo "Unsupported operating system"
exit 1
fi