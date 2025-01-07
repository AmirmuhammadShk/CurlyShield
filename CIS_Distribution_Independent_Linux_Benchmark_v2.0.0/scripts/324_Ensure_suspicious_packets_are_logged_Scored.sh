sudo echo "net.ipv4.conf.all.log_martians = 1" | sudo tee /etc/sysctl.conf >> /etc/sysctl.conf.d/99-user.conf
echo "net.ipv4.conf.default.log_martians = 1" | sudo tee /etc/sysctl.conf >> /etc/sysctl.conf.d/99-user.conf
sudo echo "net.ipv4.route.flush = 1" | sudo tee /etc/sysctl.conf >> /etc/sysctl.conf.d/99-user.conf
sudo sysctl -p
sudo sysctl --reload