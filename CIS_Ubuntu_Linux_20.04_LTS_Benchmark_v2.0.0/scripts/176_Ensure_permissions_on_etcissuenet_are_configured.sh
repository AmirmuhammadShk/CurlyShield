chown root:root $(readlink -e /etc/issue.net)
chmod u-x,go-wx $(readlink -e /etc/issue.net)
echo "Default Value:"
echo "Access: (0644/-rw-r--r--) Uid: (0/root) Gid: (0/root)"
echo "Page 188"
echo "CIS Controls:"