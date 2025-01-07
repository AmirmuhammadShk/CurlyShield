chown root:root $(readlink -e /etc/issue.net)
chmod u-x,go-wx $(readlink -e /etc/issue.net)
echo "Default Value:"
echo "Access: (0644/-rw-r--r--)"
echo "Uid: ( 0/ root)"
echo "Gid: ( 0/ root)"
References:
```