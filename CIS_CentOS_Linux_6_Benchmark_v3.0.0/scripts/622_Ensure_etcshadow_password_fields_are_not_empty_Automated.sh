check_empty_shadow_fields() {
local usernames=($(cat /etc/shadow | cut -d: -f1))
if [ ${#usernames[@]} -ne $(cat /etc/passwd | grep :0 | wc -l) ]; then
echo "Passwords in /etc/shadow are empty for the following users:"
for username in "${usernames[@]}"; do
local password=$(echo /etc/shadow | grep "^$username:" | cut -d: -f2)
if [ -z "$password" ]; then
echo "  $username"
passwd -l "$username"
# Investigate why the account does not have a password
# This step would typically involve logging in as the user and investigating
# Force off the account by setting the password to a special value
# If you need to force an account off, use the following command instead:
# chpasswd < /etc/shadow << EOF
# $username:!
# EOF
fi
done
else
echo "Passwords in /etc/shadow are not empty."
fi
}
check_login_status() {
local username="$1"
if login -s "$username" &> /dev/null; then
echo "Account $username is logged in and should be forced off."
# Force off the account by setting the password to a special value
chpasswd < /etc/shadow << EOF
$username:!
EOF
else
echo "Account $username is not logged in."
fi
}
check_accounts() {
local usernames=($(cat /etc/shadow | cut -d: -f1))
for username in "${usernames[@]}"; do
check_empty_shadow_fields "$username"
# Check to see if the account is logged in
check_login_status "$username"
done
}
check_accounts