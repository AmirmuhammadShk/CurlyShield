if [ "$(uname -a | grep ipv6)" = "ipv6" ]; then
echo "IPv6 is already enabled"
else
# Your script here to enable/disable IPv6
echo "IPv6 is now enabled"
fi
echo "${1:-Enable IPv6}" | sed -e 's/ Enable / ipv6 enable /g' | bash