apt-get update || { echo "Failed to update package index"; exit 1; }
apt-get add-apt-repositories <repository_name> || { echo "Failed to add repository"; exit 1; }
apt-get update || { echo "Failed to update package index"; exit 1; }