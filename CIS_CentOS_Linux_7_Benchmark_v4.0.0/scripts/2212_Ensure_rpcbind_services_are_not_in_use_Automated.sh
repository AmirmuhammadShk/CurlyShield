systemctl stop rpcbind.socket rpcbind.service
yum remove --force rpcbind
if yum list installed | grep -q "rpcbind"; then
systemctl mask rpcbind.socket rpcbind.service
fi