find_non_valid_login_shells() {
# Get the list of valid shells from /etc/shells
valid_shells=$(awk -F '/' '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s/,/\|/,g;p}')
while IFS= read -r user; do
# Check if the user is not root and has an invalid shell
if [ "$user" != "root" ] && awk -v pat="$valid_shells" -F: '($1 != "root" && $(NF) !~ pat)' /etc/passwd | grep "^$user:"; then
# Lock the user's account
usermod -L $user
fi
done
}
find_non_valid_login_shells