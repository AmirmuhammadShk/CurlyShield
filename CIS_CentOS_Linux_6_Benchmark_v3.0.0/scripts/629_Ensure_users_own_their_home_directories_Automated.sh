awk -F: '($1!~/(halt|sync|shutdown)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/
&& $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
if [ ! -d "$dir" ]; then
echo "User: \"$user\" home directory: \"$dir\" does not exist, creating home directory"
mkdir -m 0700 -- "$dir"
chown "$user:$user" "$dir"
else
owner=$(stat -L -c "%U" "$dir")
if [ "$owner" != "$user" ]; then
chmod g-w,o-rwx "$dir"
chown "$user:$user" "$dir"
fi
fi
done