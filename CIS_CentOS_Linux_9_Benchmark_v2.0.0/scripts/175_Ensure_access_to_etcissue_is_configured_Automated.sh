chown root:root $(readlink -e /etc/issue)
chmod u-x,go-wx $(readlink -e /etc/issue)
# Output the access settings for /etc/issue
echo "Access: (0644/-rw-r--r--) Uid: (0/root) Gid: (0/root)"