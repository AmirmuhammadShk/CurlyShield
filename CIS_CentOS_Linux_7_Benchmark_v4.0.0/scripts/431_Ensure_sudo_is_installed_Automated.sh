if ! which sudo &> /dev/null; then
# Install sudo
yum install -y sudo
fi
sudo --version