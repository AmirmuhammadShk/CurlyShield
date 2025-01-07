getent passwd | while read user; do
echo "chage --inactive 30 $user"
done
for user in $(getent passwd | cut -d: -f1); do
if chage -l "$user" | grep "Max Inactive"; then
echo "chage --inactive 30 $user"
fi
done