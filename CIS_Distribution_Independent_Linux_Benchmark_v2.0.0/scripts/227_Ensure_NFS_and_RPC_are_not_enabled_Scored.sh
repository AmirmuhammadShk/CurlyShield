chkconfig nfs off
update-rc.d nfs disable
chkconfig rpcbind off
update-rc.d rpcbind disable
systemctl disable nfs
systemctl disable rpcbind