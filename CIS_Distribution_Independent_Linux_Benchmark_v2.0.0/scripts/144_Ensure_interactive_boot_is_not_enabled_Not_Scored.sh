echo "Disabling interactive boot"
sudo systemctl toggle-interactive-boot off
echo "Recommending security controls as per CIS guidelines"
sudo echo "Control 1: Network segmentation" >> /etc/security/segementation.conf
sudo echo "Control 2: Authentication" >> /etc/auth/authors.conf