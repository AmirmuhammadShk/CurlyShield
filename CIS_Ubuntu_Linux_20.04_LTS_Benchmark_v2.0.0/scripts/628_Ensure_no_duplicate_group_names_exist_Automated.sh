while IFS= read -r line; do
if [[ $line =~ "groupname duplicates" ]]; then
echo "Error: Duplicate group name found"
exit 1
fi
done < /etc/group | grep -q 'duplicates'
if [ $? -eq 0 ]; then
# Establish unique names for the user groups and update GIDs
while IFS= read -r line; do
groupname=$(echo "$line" | cut -d: -f1)
if ! id -g "$groupname" &> /dev/null; then
echo "Creating new group $groupname..."
groupadd --gid $(seq 1000 2000) "$groupname"
fi
done < /etc/group
fi