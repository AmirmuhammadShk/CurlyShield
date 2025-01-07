lock_empty_accounts() {
while IFS= read -r line; do
username=$(echo "$line" | cut -d: -f1)
if [ -z "$(echo "$line" | grep -o password)" ]; then
echo "Locking account $username"
passwd -l "$username"
fi
done < /etc/shadow
}
lock_empty_accounts
for username in $(ps aux | grep -o "user=$username"); do
if [ "$(echo "$username" | awk '{print $1}')" -eq $$ ]; then
echo "Account $username is logged in. Investigating usage..."
fi
done
for username in $(ps aux | grep -o "user=$username"); do
if [ "$(echo "$username" | awk '{print $1}')" -eq $$ ]; then
echo "Account $username is still logged in. Forcing off..."
sudo usermod -aG nobody "$username"
fi
done