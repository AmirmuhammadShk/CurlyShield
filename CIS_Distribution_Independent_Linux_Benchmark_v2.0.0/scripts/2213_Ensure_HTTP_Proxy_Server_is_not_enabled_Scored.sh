if [ -x /usr/sbin/chkconfig ]; then
chkconfig --off squid
elif [ -x /systemd/systemctl ]; then
systemctl disable squid
elif [ -x /etc/init.d/update-rc.d ]; then
update-rc.d squid disable
fi