sed -i 's/^(telnet|tcpwrapped).*/\1 disable= yes/' /etc/inetd.conf
sed -i 's/^(telnet|tcpwrapped).*/\1 disable= yes/' /etc/xinetd.conf
find /etc/inetd.d/ -type f -exec sed -i 's/^#?//g' {} \; | grep -v '^telnet' > /dev/null
find /etc/xinetd.d/ -type f -exec sed -i 's/^#?//g' {} \; | grep -v '^telnet' > /dev/null