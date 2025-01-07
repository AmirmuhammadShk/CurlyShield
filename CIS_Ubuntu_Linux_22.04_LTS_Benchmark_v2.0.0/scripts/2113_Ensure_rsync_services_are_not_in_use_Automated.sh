systemctl stop rsync.service
apt purge rsync
if apt isinstalled rsync; then
systemctl mask rsync.service
fi