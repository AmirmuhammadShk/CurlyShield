if [ "$OSTYPE" == "msys" ]; then # Windows
echo "Enable rsyslog service on Windows"
else # Unix-based systems
systemctl enable rsyslog
fi
sudo sed -i '/rsyslog/ s/^ *//' /etc/sysconfig/syslog
sudo systemctl restart syslog