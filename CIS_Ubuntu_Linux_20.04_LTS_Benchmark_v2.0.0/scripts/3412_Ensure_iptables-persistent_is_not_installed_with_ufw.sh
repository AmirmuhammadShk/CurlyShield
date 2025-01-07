sudo apt purge iptables-persistent
if [ "$(uname -s)" == "Linux" ]; then
if ! grep -q 'ufw' /etc/apt/sources.list; then
echo 'No need to remove ufw'
else
sudo sed -i '/^#pocket\/ubuntu/!d' /etc/apt/sources.list.d/ubuntu_mainlist.deb.xml
fi
fi