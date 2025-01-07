if [ "$(uname -s)" == "Linux" ]; then
case $(dpkg -l | grep ntp) in
"*ntp*" ) echo "ntp is already installed";;
*) dnf install ntp;;
esac
elif [ "$(expr substr $(uname -s) 1 5)" == "Darwin" ]; then
brew install ntp
else
apt-get install ntp
fi
if [ ! -f /etc/chrony.conf ]; then
case $(dpkg -l | grep chrony) in
"*chrony*" ) echo "chrony is already installed";;
*) dnf install chrony;;
esac
elif [ "$(uname -s)" == "Linux" ] && [ "$(expr substr $(uname -s) 1 5)" != "Darwin" ]; then
apt-get install chrony
fi
if [ "$(uname -s)" == "Linux" ]; then
systemctl start ntp
elif [ "$(expr substr $(uname -s) 1 5)" == "Darwin" ]; then
brew services start ntp
fi