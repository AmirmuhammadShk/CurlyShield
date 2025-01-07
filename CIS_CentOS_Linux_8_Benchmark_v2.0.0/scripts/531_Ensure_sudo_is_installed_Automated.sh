sudo dnf install -y sudo
sudo systemctl enable sudo
sudo systemctl start sudo
echo "Testing sudo..."
sudo echo 'Hello World' > /root/sudo.txt
rm /root/sudo.txt