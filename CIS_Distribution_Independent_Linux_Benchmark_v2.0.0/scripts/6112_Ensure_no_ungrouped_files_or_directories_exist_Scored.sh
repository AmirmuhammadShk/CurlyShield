unowned_files=$(find / -type f -a ! -exec [ -x ] {} \; -o ! -perm -u=rwx)
if [ -n "$unowned_files" ]; then
# Reset ownership of unowned files to an active user on the system
for file in $unowned_files; do
username=$(getent passwd | cut -d: -f1)
uid=$(id -u "$username")
chown "$uid:$username" "$file"
done
fi