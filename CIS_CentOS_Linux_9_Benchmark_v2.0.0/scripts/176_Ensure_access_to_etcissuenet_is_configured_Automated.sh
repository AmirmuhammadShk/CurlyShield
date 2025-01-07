chown root:root $(readlink -e /etc/issue.net)
chmod u-x,go-wx $(readlink -e /etc/issue.net)
access="0644"
uid="0"
gid="0"
chown $uid:$gid "/etc/issue.net"
chmod $access "/etc/issue.net"