echo "restrict -4 default kod notrap nomodify nopeer noquery limited" >> /etc/ntp.conf
echo "restrict -6 default kod notrap nomodify nopeer noquery limited" >> /etc/ntp.conf
if apt list --installed | grep ntp > /dev/null; then
echo "apt purge ntp"
fi