if [ -f /etc/ldap/slapd.conf ]; then
# If LDAP is required, install sudo-ldap
apt-get update && apt-get install -y sudo-ldap
else
# If LDAP is not required, install sudo
apt-get update && apt-get install -y sudo
fi