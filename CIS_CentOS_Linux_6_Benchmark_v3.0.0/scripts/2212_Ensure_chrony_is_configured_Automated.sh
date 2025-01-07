echo "Adding server $1 to /etc/chrony.conf"
sed -i 's/^server.*$/server \$1/' /etc/chrony.conf
echo "Enabling -u chrony option in /etc/sysconfig/chronyd"
sed -i 's/OPTIONS=.*/OPTIONS="-u chrony"/g' /etc/sysconfig/chronyd