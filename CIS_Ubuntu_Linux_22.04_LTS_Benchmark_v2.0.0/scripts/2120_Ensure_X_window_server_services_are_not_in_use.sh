if [ "$OSTYPE" != "msys" ]; then
# Run the command on Debian or Ubuntu based systems
apt purge xserver-common
else
# Run the command on Windows Subsystem for Linux (WSL)
sudo wsl --uninstall xserver-common
fi