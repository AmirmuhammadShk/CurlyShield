sed -i '/^PASS_MAX_DAYS/ s/\(.*\)/\1 365/' /etc/login.defs
for user in $(getent passwd | cut -d: -f1); do
if [ "$(grep "^$user:" /etc/passwd | cut -d: -f6)" ]; then
chage --maxdays 365 "$user"
fi
done