nologin=$(command -v nologin)
while IFS= read -r line; do
# Extract user ID and group IDs from the line
user_id=$(cut -d: -f1 <<< "$line")
group_ids=$(cut -d: -f3- <<< "$line")
# Check if the user has a valid shell
valid_shell=$(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s/,\\\\/,g;p}' | paste -s -d '|' -)
# If the user's group ID is not in the expected range or their shell is not valid, set it to nologin
if [ $(awk "/^\s*UID_MIN/{print $2}" /etc/login.defs) -lt "$user_id" ] || [ $group_ids == "65534" ]; then
# Set the user's shell to nologin
system ("usermod -s '$nologin' $user_id")
fi
done < /etc/passwd