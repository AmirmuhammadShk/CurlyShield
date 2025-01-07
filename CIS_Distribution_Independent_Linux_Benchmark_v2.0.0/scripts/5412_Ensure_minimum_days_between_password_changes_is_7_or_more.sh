sed -i 's/^\(PASS_MIN_DAYS\)\s*=\s*\([^;]*\)/\1 7/' /etc/login.defs
for user in $(getent passwd | cut -d: -f1); do
if [ "$(chage -l $user)" ]; then
echo "Modifying user parameters for $user"
chage --mindays 7 $user
fi
done