sed -i '/^daytime/d' /etc/inetd.conf
find /etc/inetd.d -type f -exec sed -i 's/^daytimedaytime/' {} \;
sed -i 's/^\s*daytimedaytime/disable=yes/g' /etc/xinetd.conf
find /etc/xinetd.d -type f -exec sed -i 's/^daytimedaytime/disable=yes/g' {} \;