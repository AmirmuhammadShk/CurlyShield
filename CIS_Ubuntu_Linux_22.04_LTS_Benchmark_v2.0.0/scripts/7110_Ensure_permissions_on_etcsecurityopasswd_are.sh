if [ -e "/etc/security/opasswd" ]; then
chmod u-x,go-rwx "/etc/security/opasswd"
chown root:root "/etc/security/opasswd"
fi
if [ -e "/etc/security/opasswd.old" ]; then
chmod u-x,go-rwx "/etc/security/opasswd.old"
chown root:root "/etc/security/opasswd.old"
fi