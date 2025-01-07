sudo apt update -q || echo "Failed to update package list"
sudo apt install -y build-essential git && echo "Packages installed successfully"
mkdir ~/projects && cd ~/projects
git init -b main