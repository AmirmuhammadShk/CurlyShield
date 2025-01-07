setenforce 1
setenforce 0
sed -i 's/SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
echo "SELINUX=enforcing" > /etc/selinux/config