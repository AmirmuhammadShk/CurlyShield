gids=$(getent group | cut -d: -f3)
duplicates=$(echo "$gids" | sort -u | diff --changed-group-id <(echo "$gids") | grep -v '^$')
if [ -n "$duplicates" ]; then
for gid in $duplicates; do
group_name=$(getent group "$gid" | cut -d: -f1)
new_gid=$((gid + 1))
echo "Renaming group $group_name to group_$new_gid"
mv /etc/group/{group_$$,group_$newgid} <(echo "$group_name")
done
fi