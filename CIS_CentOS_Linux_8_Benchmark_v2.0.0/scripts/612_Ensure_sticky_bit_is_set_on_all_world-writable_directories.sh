find / -type d -perm -0002 -a ! -perm -1000 2>/dev/null | xargs -I '{}' chmod a+t '{}'
echo "Sticky bit set on world-writable directories."