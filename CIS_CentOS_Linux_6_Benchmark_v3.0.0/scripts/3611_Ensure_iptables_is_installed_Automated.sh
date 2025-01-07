yum install -y iptables
systemctl start iptables
systemctl enable iptables
if ! systemctl status iptables | grep -q 'running'; then
echo "Error: iptables is not running."
exit 1
fi
if ! nc -z localhost 50; then
echo "Error: iptables is not listening on port 50."
exit 1
fi