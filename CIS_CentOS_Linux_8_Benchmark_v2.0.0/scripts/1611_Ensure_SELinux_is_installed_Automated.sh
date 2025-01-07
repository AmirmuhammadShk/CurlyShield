dnf install libselinux
chmod +x /etc/SELinux
setenforce 0
sestatus -a
selinux-enable  enabled