if [ -f /etc/sysconfig/systemd /etc/systemd/system/avahi-daemon.service ]; then
systemctl disable --now avahi-daemon
else
chkconfig --del avahi-daemon && update-rc.d -f avahi-daemon remove && update-rc.d avahi-daemon defaults
fi
if [ -f /etc/init.d/{avahi,dhclient,inetd} ]; then
update-rc.d -f {avahi,dhclient,inetd} disable || true
fi