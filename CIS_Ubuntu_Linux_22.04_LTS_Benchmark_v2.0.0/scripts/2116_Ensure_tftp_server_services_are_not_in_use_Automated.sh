systemctl stop tftpd-hpa.service
apt purge tftpd-hpa
if apt depends tftpd-hpa; then
systemctl stop tftpd-hpa.service
systemctl mask tftpd-hpa.service
else
apt purge tftpd-hpa
fi