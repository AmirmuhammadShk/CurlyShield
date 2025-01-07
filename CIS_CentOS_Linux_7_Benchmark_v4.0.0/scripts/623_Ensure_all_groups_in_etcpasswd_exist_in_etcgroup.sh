while IFS= read -r line; do
username=$(echo "$line" | cut -d: -f1)
group_name=$(echo "$line" | cut -d: -f4)
# Get groups the user is a member of
group_memberships=$(getent passwd "$username" | cut -d: -f5)
# Check if group exists in /etc/group
grep "^$group_name:" /etc/group > /dev/null || {
echo "Group '$group_name' not found in /etc/group"
}
done < /etc/passwd