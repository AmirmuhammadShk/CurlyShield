setenforce 0
sed -i '/SELINUX/s/^.*$/SELINUX=permissive/' /etc security/selinux
modprobe -a selinux
echo "security" > /etc/security/selinux/enforce_domain_type