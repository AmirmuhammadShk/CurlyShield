systemctl stop rpcbind.socket rpcbind.service
apt purge -y rpcbind
if apt is Installed rpcbind; then
systemctl mask rpcbind.socket rpcbind.service
else
systemctl unmask rpcbind.socket rpcbind.service
fi