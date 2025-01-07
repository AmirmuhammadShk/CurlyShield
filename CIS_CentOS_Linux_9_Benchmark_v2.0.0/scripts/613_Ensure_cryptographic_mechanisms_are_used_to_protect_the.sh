readlink -f /sbin | while read path; do
echo "Audit Tools"
printf "%s p+i+n+u+g+s+b+acl+xattrs+sha512" "$path"
done >> /etc/aide.conf