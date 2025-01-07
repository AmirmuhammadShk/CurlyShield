setenforce 0
sed -i '/SELINUX=/c "SELINUX= enforcing"' /etc/sysctl.conf
modprobe selinux
groupadd sbin
usermod -aG sbin $USER
getent group | cut -d: -f4 > /tmp/newgroups && (echo "$USER:$$:($(id -gns $USER)):sbin"; echo "/home/$USER/sbin" > /tmp/newpasswd) && (usermod -p $(cat /tmp/newpasswd) $USER; usermod -G $(cut -d: -f4 /tmp/newgroups) $USER)
reboot