if [ -x "$(command -v apt)" ]; then
# Remove package if installed
sudo apt purge rsync
elif [ -x "$(command -v systemctl)" ]; then
# Stop and mask service
sudo systemctl stop rsync
sudo systemctl mask rsync
fi