users=$(getent passwd | awk '{if ($3 == 0) {print $1}}')
for user in $users; do
# Assign a new UID if necessary or remove the account
new_uid=$(( ${user} - 1 ))
user_id=$(id -u "$user" 2>/dev/null)
if [ -n "$user_id" ]; then
chown root:$new_uid "$user"
echo "UID of $user changed to $new_uid"
else
userdel "$user"
fi
done