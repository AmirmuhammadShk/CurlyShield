users_with_future_password_change_date=$(getent passwd | awk -F: '$3>=$(date +%s)/86400 {print $1}')
if [ -n "$users_with_future_password_change_date" ]; then
# Lock the accounts
for user in $users_with_future_password_change_date; do
echo "Locking account $user"
usermod -L $user
done
# Expire the passwords
for user in $users_with_future_password_change_date; do
echo "Expiring password for $user"
passwd -e $user
done
# Reset the passwords manually
for user in $users_with_future_password_change_date; do
echo "Resetting password for $user"
passwd -p `openssl rand -base64 32` $user
done
fi