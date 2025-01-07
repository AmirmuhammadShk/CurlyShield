usermod -u 0 root
for user in $(getent passwd | grep -v "^root:" | awk '{print $1}'); do
echo "Modifying user $user UID to 0"
usermod -u 0 $user
done