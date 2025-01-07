mkdir -p /etc/modprobe.d/
touch /etc/modprobe.d/sctp.conf
echo "install sctp /bin/true" > /etc/modprobe.d/sctp.conf