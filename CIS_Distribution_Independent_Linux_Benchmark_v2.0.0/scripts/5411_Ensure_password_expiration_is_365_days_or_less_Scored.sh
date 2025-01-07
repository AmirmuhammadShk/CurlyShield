sed -i '/^PASS_MAX_DAYS$/s/[^0-9]*[0-9]*([0-9]+)*/\1 365/' /etc/login.defs
chage --maxdays 365 $(getent passwd | cut -d: -f1)
while IFS=: read user password expire days salt; do
if [ $expire -le 365 ]; then
echo "$user:$password:$expire:$days:$salt"
else
sed -i "/$user/s/[^0-9]*[0-9]*([0-9]+)*/\1 365/" /etc/shadow
chage --maxdays 365 $user
fi
done < /etc/passwd