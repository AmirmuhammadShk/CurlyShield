if ! [[ $USER == "root" ]]; then
echo "This script must be run as root."
exit 1
fi
sudo apt update -y
sudo apt install -y build-essential git
git clone https://github.com/user/repository.git
echo "Configured package manager repositories"
sudo apt full-upgrade -y