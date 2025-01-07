echo "Enabling IPv4 and IPv6 support"
echo "restrict -4 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf
echo "restrict -6 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf
read -p "Enter remote-server IP address: " remote_server
echo "server $remote_server" >> /etc/ntp.conf
echo "-u ntp:ntp" >> /etc/sysconfig/ntpd