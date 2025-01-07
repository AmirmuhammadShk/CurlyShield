systemctl stop nfs-server.service
dnf remove -y nfs-utils
if [ $? -ne 0 ]; then
systemctl mask nfs-server.service
fi