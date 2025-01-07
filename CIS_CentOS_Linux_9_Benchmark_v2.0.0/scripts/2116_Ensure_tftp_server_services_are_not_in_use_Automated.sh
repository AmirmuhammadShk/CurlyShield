systemctl stop tftp.socket tftp.service
dnf remove --allow-vulnerable tftp-server
if [ $? -ne 0 ]; then
systemctl mask tftp.socket tftp.service
fi