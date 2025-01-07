apt install -y apparmor apparmor-utils
update-rc.d apparmor defaults
setfacl -m u:$(id -u):r-- /home/user
apparmor_parse_profile /etc/apparmor/profiles/dirmngr
echo "AppArmor profile loaded successfully."
sudo systemctl enable apparmor
usermod -aG apparmor your_username