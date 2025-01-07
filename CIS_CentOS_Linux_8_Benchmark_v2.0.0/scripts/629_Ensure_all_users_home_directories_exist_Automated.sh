if [ -z "${HOME}" ]; then
echo "Removing user without assigned home directory"
userdel -r "$USER"
exit 1
fi
users=$(getent passwd | awk -F: '{print $1}')
for user in $users; do
dir="/home/$user"
if [ ! -d "$dir" ]; then
mkdir -m0700 "$dir"
chown "$user:$user" "$dir"
fi
done