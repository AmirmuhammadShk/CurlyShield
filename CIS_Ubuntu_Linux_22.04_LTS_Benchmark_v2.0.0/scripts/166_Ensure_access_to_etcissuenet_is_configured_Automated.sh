chown root:root $(readlink -e /etc/issue.net)
chmod u-x,go-wx $(readlink -e /etc/issue.net)
chmod 0644 $(readlink -e /etc/issue.net)
usermod --uid 0 --gid 0 root