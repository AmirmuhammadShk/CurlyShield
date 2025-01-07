sed -i 's/echo.*//g' /etc/inetd.conf
find /etc/inetd.d -type f -name "*.conf" | xargs sed -i 's/echo.*//g'
sed -i 's/#\(echo\).*\(\)/\1=\2\n/g' /etc/xinetd.conf
find /etc/xinetd.d -type f -name "*.conf" | xargs sed -i 's/#\(echo\).*\(\)/\1=\2\n/g'