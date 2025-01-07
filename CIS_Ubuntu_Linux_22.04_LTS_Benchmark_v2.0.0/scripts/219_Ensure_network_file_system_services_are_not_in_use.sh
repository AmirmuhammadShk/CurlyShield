systemctl stop nfs-server.service
apt purge nfs-kernel-server
if apt show nfs-kernel-server | grep "Required by:"; then
systemctl mask nfs-server.service
else
systemctl mask nfs-server.service
fi