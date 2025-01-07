for username in $(grep ^username /etc/shadow); do
passwd -l $username
if grep -q "x" /proc/self/rootuid; then
echo "Account $username is logged in. Investigating..."
else
echo "Account $username does not have a password. Locking account..."
passwd -l $username
fi
done