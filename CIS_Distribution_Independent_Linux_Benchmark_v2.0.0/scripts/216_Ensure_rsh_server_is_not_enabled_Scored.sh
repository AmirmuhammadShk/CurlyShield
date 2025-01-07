for service in rsh rlogin rexec; do
sed -i 's/enable=yes/disable=y/' /etc/xinetd.conf
sed -i "s|^\(.*\).*$/ disable = y$&" /etc/xinetd.d/${service}
done
sed -i '/shell/ s/^.*//g' /etc/inetd.conf
sed -i '/login/ s/^.*//g' /etc/inetd.conf
sed -i '/exec/ s/^.*//g' /etc/inetd.conf