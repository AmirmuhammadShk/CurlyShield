dnf remove vsftpd
find /etc/vsftpd -type f -exec rm {} \;
chmod -R 755 /var/vsftpd
chown -R vsftpd:vsftpd /var/vsftpd