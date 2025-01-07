chown root:root $(readlink -e /etc/issue)
chmod u-x,go-wx $(readlink -e /etc/issue)
default_values=$(cat << EOF
Access: (0644/-rw-r--r--)
Uid: (0/root)
Gid: (0/root)
EOF
)
echo "$default_values" >> $(readlink -e /etc/issue)