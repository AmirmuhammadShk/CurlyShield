service iptables save
iptables -L
if [ "$?" -ne 0 ]; then
echo "Failed to review iptables configuration"
exit 1
fi