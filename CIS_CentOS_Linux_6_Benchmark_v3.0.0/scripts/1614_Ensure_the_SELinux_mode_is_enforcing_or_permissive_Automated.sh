setenforce 1
setenforce 0
sed -i 's/SELINUX=.*$/SELINUX=enforcing/' /etc/selinux/config
or
sed -i 's/SELINUX=.*$/SELINUX=permissive/' /etc/selinux/config