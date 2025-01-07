systemctl stop snmpd.service
dnf remove net-snmp || true # If the package is already removed, this command will be ignored
systemctl mask snmpd.service