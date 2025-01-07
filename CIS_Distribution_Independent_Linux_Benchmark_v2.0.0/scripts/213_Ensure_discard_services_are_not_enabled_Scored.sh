sed -i '/^discard/d' /etc/inetd.conf
find /etc/inetd.d/ -name "*.conf" | sed -i 's/^discard//g'
sed -i '/^discard/d' /etc/xinetd.conf
find /etc/xinetd.d/ -name "*.conf" | sed -i 's/^discard=//g'