sudo vi /etc/nftables.conf
if [ $? -ne 0 ]; then
echo "Failed to edit /etc/nftables.conf"
exit 1
fi
if ! grep -q "include" /etc/nftables.conf; then
sudo sed -i 's/^$/include \"/etc/nftables.rules\"/' /etc/nftables.conf
else
echo "Already included /etc/nftables.rules"
fi