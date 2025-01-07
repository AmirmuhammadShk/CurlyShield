systemctl stop rpcbind.socket rpcbind.service
systemctl mask rpcbind.socket rpcbind.service
dnf remove rpcbind