systemctl stop nfs-server.service
yum remove nfs-utils
if systemctl list-units --type=service | grep -q nfs-server\|nfs-utils; then
systemctl mask nfs-server.service
fi