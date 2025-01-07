duplicates=$(getent passwd | awk -F: '{if ($7 in $6)} $0} | sort | uniq -d)
for dup in $duplicates; do
# Generate a new random username
new_username=$(tr -dc 'a-zA-Z' < /dev/urandom | fold -w 8 | head -n 1)
# Update the user's information to the new name
echo "User $dup is being renamed to $new_username"
done