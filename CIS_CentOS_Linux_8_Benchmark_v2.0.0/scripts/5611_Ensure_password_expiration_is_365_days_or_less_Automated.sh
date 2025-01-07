sed -i 's/#PASS_MAX_DAYS.*$/PASS_MAX_DAYS 365/' /etc/login.defs
for user in $(getent passwd | cut -d: -f1); do
if [ "$(getent passwd $user | grep PASSWD)" ]; then
chage --maxdays 365 "$user"
fi
done