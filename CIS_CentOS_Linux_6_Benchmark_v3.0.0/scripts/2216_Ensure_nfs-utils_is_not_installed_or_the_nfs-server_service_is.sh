yum remove -y nfs-utils
chkconfig --del nfs
service nfs stop
if yum repolist | grep "^repo-" | cut -d: -f2- | sort -u | tr '\n' ' '; then
chkconfig nfs on
fi