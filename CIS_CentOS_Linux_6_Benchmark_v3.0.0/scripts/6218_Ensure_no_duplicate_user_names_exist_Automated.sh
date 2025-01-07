duplicates=$(awk -F: '{if ($2 in a) {print $0}}' /etc/passwd | sort | uniq -d)
new_users=()
for user in $(echo "$duplicates" | cut -d: -f1); do
new_user="user$((($RANDOM % 900) + 100))"
echo "Renaming $user to $new_user"
new_users+=($new_user)
done
for user in "${new_users[@]}"; do
sed -i "/^$user$/s/.*/${user}_\$(date +%s)/" /etc/passwd
done
for user in $(echo "$duplicates" | cut -d: -f1); do
new_uid=$(awk -F: 'NR==FIND{print $2}' /etc/passwd | grep -n ${user} | awk '{print $2}')
echo "Updating UID for user $user to $new_uid"
sed -i "/^$user$/s/.*UID=//s UID=.*$/UID=$new_uid/" /etc/passwd
done
for user in $(echo "$duplicates" | cut -d: -f1); do
echo "Updating GID for user $user"
echo "${new_users[0]};${new_users[1]}" > /home/${new_users[0]}/group
done