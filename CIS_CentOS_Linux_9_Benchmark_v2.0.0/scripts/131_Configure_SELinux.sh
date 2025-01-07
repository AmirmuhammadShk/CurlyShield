setenforce 0
semodule -v 30
restorecon -R /etc/network
firewalld --zone=public --enable Selinux
reload selinux