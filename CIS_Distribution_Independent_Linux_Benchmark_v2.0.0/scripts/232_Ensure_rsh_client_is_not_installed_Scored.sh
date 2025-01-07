case "$OSTYPE" in
msys*|cygwin*)
apt-get remove rsh
;;
linux*|darwin*)
yum remove rsh
;;
*)
echo "Unsupported OS"
exit 1
;;
esac