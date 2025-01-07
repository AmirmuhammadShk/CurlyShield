for user in $(getent passwd | awk -F: 'Uid==0 {print $1}'); do
echo "Removing user $user"
userdel -r $user
done
new_uid=$((100000))
echo "Assigning new UID $new_uid to root"
usermod -u $new_uid root