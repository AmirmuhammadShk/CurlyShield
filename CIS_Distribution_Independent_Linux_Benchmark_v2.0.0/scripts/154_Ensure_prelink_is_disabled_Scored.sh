set -e
prelink -ua
if [[ "$OSTYPE" == "msys" ]]; then
yum remove prelink
elif [[ "$OSTYPE" == "darwin"* ]]; then
brew uninstall prelink
else
zypper remove prelink
fi