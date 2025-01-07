for file in $(find / -type f -o -type d); do
uid=$(stat -c%u "$file")
gid=$(stat -c%g "$file")
if ! grep -q "^$uid:" /etc/group || ! grep -q "^$gid:" /etc/group; then
user=$(id -ru $uid)
group=$(id -rg $gid)
echo "Resetting ownership of $file to $user:$group"
chown "$user:$group" "$file"
fi
done