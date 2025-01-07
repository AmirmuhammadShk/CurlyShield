echo "* hard core 0" > /etc/security/limits.conf
echo "fs.suid_dumpable = 0" > /etc/sysctl.conf
sysctl -w fs.suid_dumpable=0
if [ -f /etc/systemd/coredump.conf ]; then
echo "Storage=none" >> /etc/systemd/coredump.conf
echo "ProcessSizeMax=0" >> /etc/systemd/coredump.conf
fi
systemctl daemon-reload