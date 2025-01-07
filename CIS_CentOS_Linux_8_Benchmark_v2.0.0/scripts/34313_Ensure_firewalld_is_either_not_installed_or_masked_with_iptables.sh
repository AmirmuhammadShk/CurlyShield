if [ -x "/usr/sbin/firelwall" ]; then
yum remove firewalld
else
systemctl --now mask firewalld
fi
echo "Firewalld configuration updated."