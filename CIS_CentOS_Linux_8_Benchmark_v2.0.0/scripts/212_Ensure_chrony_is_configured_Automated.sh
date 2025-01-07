echo "server <remote-server>" >> /etc/chrony.conf
sed -i 's/OPTIONS=.*$/OPTIONS="-u chrony"' /etc/sysconfig/chronyd
systemctl restart chronyd
if [ $(cat /usr/bin/chronyc --version | grep -oE '[0-9]+') -ge 201 ) ]; then
echo "Chrony is configured correctly."
else
echo "Please ensure chrony is configured according to the recommendations for version >= 2.1.2"
fi