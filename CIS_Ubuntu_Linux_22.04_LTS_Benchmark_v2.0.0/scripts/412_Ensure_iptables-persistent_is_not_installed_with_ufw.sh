sudo apt purge iptables-persistent && sudo apt autoremove -y || true
sudo update-ufw && sudo ufw disable
sudo ufw delete  # Replace with specific rule IDs if needed