mkdir -p /etc/modprobe.d/
touch /etc/modprobe.d/dccp.conf
echo "install dccp /bin/true" >> /etc/modprobe.d/dccp.conf