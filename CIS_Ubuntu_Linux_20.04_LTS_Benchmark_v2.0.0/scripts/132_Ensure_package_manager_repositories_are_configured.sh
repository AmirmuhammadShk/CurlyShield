packages=$(apt update --fix-missing)
if [ $? -ne 0 ]; then
echo "Failed to configure package manager repositories"
exit 1
fi
packages=$(apt install -y $packages required_package)
rm -rf /tmp/apt*
dpkg --list | grep $packages