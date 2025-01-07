dnf remove rpcbind
systemctl --now mask rpcbind
systemctl --now mask rpcbind.socket