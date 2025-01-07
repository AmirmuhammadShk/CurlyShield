sudo update-logrotate-script
sudo echo "maxage 7" | sudo tee /etc/logrotate.conf
sudo logrotate -f /etc/logrotate.conf