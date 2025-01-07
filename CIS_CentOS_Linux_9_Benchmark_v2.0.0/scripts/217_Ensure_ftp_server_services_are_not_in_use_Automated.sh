systemctl stop vsftpd.service
dnf remove --allow-reinstall vsftpd
if dnf depends vsftpd; then
systemctl mask vsftpd.service
else
# Remove vsftpd package and mask the service
dnf remove vsftpd
systemctl mask vsftpd.service
fi