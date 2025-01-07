sudo apt update -y
sudo apt install -y apparmor-utils apparmor-profiles
sudo sysctl -w kernel.apparmor.profile=3
sudo apparmor_parser /etc/apparmour/99-local
sudo update-apparmor-database