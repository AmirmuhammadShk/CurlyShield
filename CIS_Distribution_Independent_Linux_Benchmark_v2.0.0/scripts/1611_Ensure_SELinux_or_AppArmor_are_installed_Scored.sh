if [ "$(uname -s)" == "Linux" ]; then
case "$OSTYPE" in
msys*|cygwin*)
echo "Using Cygwin package manager"
yum install libselinux
;;
mingw*)
echo "Using MinGW package manager"
apt-get install libselinux1
;;
linux*)
echo "Using Linux package manager"
zypper install libselinux
;;
esac
else
echo "Unsupported operating system"
fi