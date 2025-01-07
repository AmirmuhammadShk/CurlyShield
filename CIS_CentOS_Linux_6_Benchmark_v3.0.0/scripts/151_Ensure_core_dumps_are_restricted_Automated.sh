echo "* hard core 0" > /etc/security/limits.conf
sed -i '/^fs.suid_dumpable/d i fs.suid_dumpable=0' /etc/sysctl.conf