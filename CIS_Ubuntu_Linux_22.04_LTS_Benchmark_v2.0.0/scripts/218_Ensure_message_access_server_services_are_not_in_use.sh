systemctl stop dovecot.socket
systemctl stop dovecot.service
apt purge dovecot-imapd dovecot-pop3d
if [ -f /etc/apparmor/profiles/default ]; then
systemctl mask dovecot.socket
systemctl mask dovecot.service
fi