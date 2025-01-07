if [ -f /etc/X11/xorg.conf ]; then
rm /etc/X11/xorg.conf
fi
yum remove xorg-x11-server-common
rpm --force  -e "xorg-x11-server-common"
echo "X Window server services removed successfully"