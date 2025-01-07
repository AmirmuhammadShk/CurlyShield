echo "Enabling IPv4 restrictions in /etc/ntp.conf"
echo "restrict -4 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf
echo "Enabling IPv6 restrictions in /etc/ntp.conf"
echo "restrict -6 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf
echo "Adding IPv4 server to /etc/ntp.conf"
echo "server <remote-server>" >> /etc/ntp.conf
echo "Adding IPv6 server to /etc/ntp.conf"
echo "server <remote-server>" >> /etc/ntp.conf
if [ "$(uname)" == "Linux" ]; then
echo "Configuring ntp on Linux system"
echo "OPTIONS=\"-u ntp:ntp\"" > /etc/sysconfig/ntpd
else
echo "Configuring ntp on ${DISTRIBUTION} system"
echo "NTPD_OPTIONS=\"-u ntp:ntp\"" >> /etc/sysconfig/ntp
fi
echo "Running ntpd with default options"
sudo service ntp restart
if [ "$(uname)" == "Linux" ]; then
sudo chkconfig ntp on
else
sudo rc-update add ntp default
fi