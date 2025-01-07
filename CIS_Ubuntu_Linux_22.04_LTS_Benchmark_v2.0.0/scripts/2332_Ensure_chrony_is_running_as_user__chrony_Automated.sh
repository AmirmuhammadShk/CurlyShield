sudo userdel -r _chrony || true
sudo useradd _chrony
if [ "$(apt list --installed 2>&1)" | grep -q "chrony" ]; then
sudo apt purge chrony && sudo apt autoremove chrony
fi