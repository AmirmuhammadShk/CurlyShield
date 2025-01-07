systemctl stop snmpd.service
apt purge snmpd
systemctl stop snmpd.service
systemctl mask snmpd.service