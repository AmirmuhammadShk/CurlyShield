chown root:root $(readlink -e /etc/issue)
chmod u-x,go-wx $(readlink -e /etc/issue)
echo "Access: (0644/-rw-r--r--)" >> /etc/issue
echo "Uid: (0/root)" >> /etc/issue
echo "Gid: (0/root)" >> /etc/issue