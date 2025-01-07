sed -i '/^PASS_MAX_DAYS/d' /etc/login.defs
echo "PASS_MAX_DAYS 365" >> /etc/login.defs
for user in $(getent passwd | cut -d: -f1); do
if [ $(chage -l $user | grep MAX_DAYS) ]; then
chage -m 365 $user
fi
done