echo "PASS_MAX_DAYS 365" >> /etc/login.defs
for user in $(getent passwd | awk '{print $1}'); do
echo "chage --maxdays 365 $user"
done