audit_script=$(./audit_script.sh)
if [ -z "$audit_script" ]; then
echo "No audit results found"
else
gids=($(echo "$audit_script" | grep -oE '[0-9]+'))
declare -A unique_gids
for gid in "${gids[@]}"; do
if [[ ! ${unique_gids[$gid]} ]]; then
unique_gids[$gid]=$gid
group=$(getent group $gid | awk '{print $1}')
if [ $? -eq 0 ]; then
echo "File owned by shared GID $gid, should belong to $group"
else
echo "Could not determine file ownership for GID $gid"
fi
fi
done
for gid in "${!unique_gids[@]}"; do
unique_gids[$gid]=${unique_gids[$gid]}
if [ $(getent group ${unique_gids[$gid]}) -eq 0 ]; then
echo "Duplicate GID $gid, consider merging or removing"
fi
done
fi