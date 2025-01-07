if [ -f /etc/nsswitch.conf ]; then
sed -i 's/yp=on /yp=off/' /etc/nsswitch.conf
fi
yum remove ypserv