chkconfig vsftpd off || echo "vsftpd configuration failed"
systemctl disable vsftpd || echo "vsftpd service failed to disable"
update-rc.d vsftpd disable || echo "vsftpd runlevel failed"