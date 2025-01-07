GROUPS=$(getent group | awk '{print $1}' | sort -u | wc -l)
if [ $GROUPS -gt 1 ]; then
# Print a message indicating that duplicate groups have been found
echo "Duplicate group names detected."
# Get the list of all group IDs
GROUP_IDS=$(getent group | awk '{print $GID}' | sort -u)
# Check if any group IDs are not unique
UNIQUE_GROUP_IDS=($(echo "$GROUP_IDS" | tr ' ' '\n' | uniq -d))
# If there are duplicate group IDs, print a message and exit
if [ ${#UNIQUE_GROUP_IDS[@]} -gt 0 ]; then
echo "The following group IDs are not unique:"
for id in "${UNIQUE_GROUP_IDS[@]}"; do
echo "$id"
done
exit 1
fi
# Rename the duplicate groups to have unique GIDs
for id in $(echo "$GROUP_IDS" | tr ' ' '\n' | sort -u); do
while [ $id -lt $(getent group | awk '{print $GID}' | sort -u | tail -n 1) ]; do
new_id=$((id + 1))
echo "Renaming group `$id` to group $new_id"
mv /etc/group `/etc/group.$((id-1))`
sed -i "s/$id/$new_id/g" /etc/group
id=$new_id
done
done
# Print a success message
echo "Duplicate groups have been renamed to have unique GIDs."
fi