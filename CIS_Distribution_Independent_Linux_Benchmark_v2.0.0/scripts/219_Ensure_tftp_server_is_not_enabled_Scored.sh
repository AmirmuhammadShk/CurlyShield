find /etc/inetd.conf -exec sed 's/^t[^[:space:]]*//g' {} \;
find /etc/xinetd.conf -exec sed 's/^\(t\|tftp\).*\(=.*\).*/\1=\2 disable=yes/g' {} \;
find /etc/inetd.d/* -type f -exec sed 's/^t[^[:space:]]*//g' {} \;