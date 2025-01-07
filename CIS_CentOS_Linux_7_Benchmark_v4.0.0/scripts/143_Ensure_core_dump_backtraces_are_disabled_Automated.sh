echo "ProcessSizeMax=0" > /etc/systemd/coredump.conf
sed -i 's/.*$/ProcessSizeMax=2G/' /etc/systemd/coredump.conf