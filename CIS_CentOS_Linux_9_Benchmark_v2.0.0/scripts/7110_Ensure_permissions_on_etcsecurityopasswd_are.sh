if [ -e "/etc/security/opasswd" ]; then
chmod u-x,go-rwx /etc/security/opasswd
fi
chown root:root /etc/security/opasswd
if [ -e "/etc/security/opasswf_old" ]; then
chmod u-x,go-rwx /etc/security/opasswf_old
fi
chown root:root /etc/security/opasswf_old