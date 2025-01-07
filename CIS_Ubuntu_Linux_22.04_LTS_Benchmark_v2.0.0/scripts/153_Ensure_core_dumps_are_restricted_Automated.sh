sysctl -w fs.suid_dumpable=0
sed -i 's/^Storage=.*/Storage=none/' /etc/systemd/coredump.conf
systemctl daemon-reload