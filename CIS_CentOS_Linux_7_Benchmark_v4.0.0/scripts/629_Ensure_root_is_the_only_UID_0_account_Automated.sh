users=$(getent pass | awk '{print $1}' | grep '0')
for user in $users; do
if [ "$user" != "root" ]; then
# Assign a new UID or remove the user
echo "Removing user $user"
userdel -r $user
fi
done