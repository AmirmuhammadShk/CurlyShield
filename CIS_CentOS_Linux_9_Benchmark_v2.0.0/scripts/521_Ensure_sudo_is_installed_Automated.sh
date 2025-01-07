sudo yum -y install sudo
sudo systemctl enable sudo
sudo systemctl restart systemd-networkd
sudo usermod -aG sudo $USER