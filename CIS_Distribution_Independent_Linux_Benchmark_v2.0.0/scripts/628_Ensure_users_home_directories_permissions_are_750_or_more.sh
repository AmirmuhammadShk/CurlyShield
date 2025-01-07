dir="/home"
for user in $(getent passwd | cut -d: -f6); do
# Check the current permissions
if [ "$(stat -c %a "$dir/$user")" -lt 700 ]; then
# Report the issue and determine action
echo "User $user's home directory permission is not 750 or higher"
fi
done