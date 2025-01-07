case "$(uname -s)" in
linux|gnu/linux)
yum remove xorg-x11*
apt-get remove xserver-xorg*
;;
openSUSE)
zypper remove xorg-x11*
;;
*)
# Handle other Linux distributions not supported by case statement
echo "Unsupported Linux distribution"
exit 1
esac