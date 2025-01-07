systemctl stop snmpd.service
yum remove -y net-snmp || true
systemctl mask snmpd.service || true