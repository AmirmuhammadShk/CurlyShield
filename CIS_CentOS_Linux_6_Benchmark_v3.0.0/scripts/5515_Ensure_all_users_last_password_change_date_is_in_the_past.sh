users_with_future_password_change=$(getent passwd | awk -F: '{if ($7 > 0) print $1}')
lock_accounts() {
echo "$2" | chpasswd
}
reset_passwords() {
echo "$2" | chpasswd --exp $3 || echo "$2" | chpasswd --password=$4
}
for user in $users_with_future_password_change; do
lock_accounts $user "lockuser,$user"
reset_passwords $user "expireuser,$user,0,`
done