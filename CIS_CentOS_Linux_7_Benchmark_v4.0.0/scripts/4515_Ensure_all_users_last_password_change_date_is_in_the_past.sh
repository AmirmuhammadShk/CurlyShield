for user in $(getent passwd | awk '{print $1}'); do
password_change_date=$(getent passwd "$user" | cut -d: -f5)
if [ "$(date -d "$password_change_date" +%s)" -gt "$(date +%s)"); then
echo "User $user has a password change date in the future"
# Locking or expiring/Resetting password manually
userlock "$user"
fi
done
userlock() {
echo "$1" | chpasswd
echo "Locking user $1"
}
getent passwd | while read username; do
password=$(getent passwd "$username" | cut -d: -f5)
new_password=$(date +%s)
updated_password="$new_password:$password:$username:x:1001:$user:$(whoami):/home/$username"
echo "$updated_password" > /etc/passwd
done