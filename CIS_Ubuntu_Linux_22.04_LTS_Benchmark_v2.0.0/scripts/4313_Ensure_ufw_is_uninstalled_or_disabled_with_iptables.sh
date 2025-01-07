sudo apt purge ufw
sudo systemctl stop ufw
sudo systemctl mask ufw
echo "UFW has been successfully removed and disabled."