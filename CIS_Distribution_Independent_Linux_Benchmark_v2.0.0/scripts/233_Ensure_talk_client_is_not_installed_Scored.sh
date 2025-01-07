if [ "$(expr substr $(uname -s) 'Linux')" == "Linux" ]; then
yum remove talk
elif [ "$(expr substr $(uname -s) 'Darwin')" == "Darwin" ]; then
brew uninstall talk
fi
if [ "$1" = "remove_after_use" ]; then
if [ "$(expr substr $(uname -s) 'Linux')" == "Linux" ]; then
yum remove talk
elif [ "$(expr substr $(uname -s) 'Darwin')" == "Darwin" ]; then
brew uninstall talk
fi
fi