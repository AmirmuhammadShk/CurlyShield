users_with_future_password_change=$(getent passwd | awk '{if ($5 > $(date -d "-90 days" +%s)) {print $1}}')
if [ -n "$users_with_future_password_change" ]; then
echo "Users with future password change date: $users_with_future_password_change"
# Lock the accounts of these users
for user in $users_with_future_password_change; do
user_pass=$(getent passwd $user | awk '{print $1}')
sed -i "/$user/d" /etc/passwd
echo "$user:$user:!*!$(date +%s):99999:*:"/home/$user:/bin/sh"
done
# Expiring the password of these users (useful for long-term security)
for user in $users_with_future_password_change; do
user_pass=$(getent passwd $user | awk '{print $1}')
echo "$user:$user:!*!$(date +%s):0:99999:*:"/home/$user:/bin/sh"
done
# Reset the password of these users (useful if you want to provide a new password)
for user in $users_with_future_password_change; do
user_pass=$(getent passwd $user | awk '{print $1}')
echo "$user:$new_password$":*!:$(date +%s):0:99999:*:"/home/$user:/bin/sh"
done
else
echo "No users with future password change date."
fi