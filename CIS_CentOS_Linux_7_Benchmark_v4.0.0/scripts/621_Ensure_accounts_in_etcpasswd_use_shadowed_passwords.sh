pwconv
for account in /etc/passwd; do
loginname=$(echo "$account" | cut -d: -f1)
id=$(echo "$account" | cut -d: -f2-)
# Check if account is logged in
if ps aux | grep $loginname > /dev/null; then
echo "Account $loginname is logged in."
echo "Force logoff command: scrdisk /user/$loginname"
else
echo "Account $loginname is not logged in. No action required."
fi
done