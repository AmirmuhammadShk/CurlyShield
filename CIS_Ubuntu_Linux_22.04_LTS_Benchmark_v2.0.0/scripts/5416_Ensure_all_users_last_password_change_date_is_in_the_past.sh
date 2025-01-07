for user in $(getent passwd | awk '{print $1}'); do
password_change_date=$(getent passwd $user | grep pwd_expiration | cut -d: -f2)
if [ "$password_change_date" != "Never" ]; then
echo "User: $user, Password Change Date: $password_change_date"
# Lock account or expire/ reset password as needed
fi
done