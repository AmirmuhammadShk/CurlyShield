systemctl stop dovecot.socket
systemctl stop dovecot.service
dnf remove dovecot
if systemctl list-units --type=service | grep -q "cyrus-imapd\."; then
systemctl stop cyrus-imapd.service
systemctl mask cyrus-imapd.service
dnf remove cyrus-imapd
fi