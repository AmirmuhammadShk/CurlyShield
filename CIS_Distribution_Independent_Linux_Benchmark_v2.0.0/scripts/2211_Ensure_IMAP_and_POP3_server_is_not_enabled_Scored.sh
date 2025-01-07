chkconfig dovecot off || { echo "Failed to disable dovecot"; exit 1; }
systemctl disable dovecot || { echo "Failed to disable dovecot"; exit 1; }
update-rc.d dovecot disable || { echo "Failed to disable dovecot"; exit 1; }
echo "Auditing courier-imap and cyrus-imap mail servers..."
echo "Additional methods of disabling a service exist. Consult your distribution documentation"
echo "for appropriate methods."
echo "Several IMAP/POP3 servers exist and can use other service names."