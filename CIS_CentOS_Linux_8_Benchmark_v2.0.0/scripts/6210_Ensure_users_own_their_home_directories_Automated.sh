awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
if [ ! -d "$dir" ]; then
echo "User: \"$user\" home directory: \"$dir\" does not exist, creating home directory"
mkdir -m 700 -- "$dir"
chown "$user:$user" "$dir"
else
owner=$(stat -L -c "%U" "$dir")
if [ "$owner" != "$user" ]; then
chmod g-w,o-rwx "$dir"
chown "$user:$user" "$dir"
fi
fi
done
This script does the same thing as your original bash script, but with a few improvements. The 'mkdir' command now has the correct permissions set and ownership of both the owner and group set using 'chown'.