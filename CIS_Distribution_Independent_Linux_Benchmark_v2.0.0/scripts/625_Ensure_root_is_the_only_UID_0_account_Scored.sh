for user in /etc/passwd; do
uid=$(cut -d: -f3 <<< "$user")
if [ $uid -eq 0 ]; then
user_name=$(cut -d: -f1 <<< "$user")
echo "User $user_name is currently using UID 0. Please assign a new UID or remove the user."
fi
done
for user in /etc/passwd; do
uid=$(cut -d: -f3 <<< "$user")
if [ $uid -ne 0 ]; then
new_uid=$(( ( RANDOM % 65536 ) ))
user_name=$(cut -d: -f1 <<< "$user")
echo "User $user_name is using UID $uid. Assigning new UID $new_uid."
sed -i s/uid=.*$/uid=$new_uid/ /etc/passwd
fi
done
chown root:root /etc/passwd