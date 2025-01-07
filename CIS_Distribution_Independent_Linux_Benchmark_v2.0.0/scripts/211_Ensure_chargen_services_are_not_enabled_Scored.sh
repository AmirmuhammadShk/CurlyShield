sed -i '/^chargen/d' /etc/inetd.conf
find /etc/inetd.d/ -type f -name "*.conf" | xargs sed -i 's/^chargen.*/\#\1/' -
sed -i '/^chargen/d' /etc/xinetd.conf
find /etc/xinetd.d/ -type f -name "*.conf" | xargs sed -i 's/^chargen.*/\#&/' -
cat /etc/inetd.conf
cat /etc/xinetd.conf