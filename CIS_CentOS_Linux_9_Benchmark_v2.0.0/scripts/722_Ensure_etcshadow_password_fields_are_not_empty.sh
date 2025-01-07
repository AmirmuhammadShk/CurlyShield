for username in $(cat /etc/shadow | cut -d: -f1); do
if [ ! -z "${password}" ]; then
echo "Locking account $username"
passwd -l "$username" || true
fi
# Check if the account is logged in and investigate what it's being used for
if login -u "$username"; then
echo "Account $username is logged in. Investigating usage..."
else
echo "Account $username is not logged in."
fi
done