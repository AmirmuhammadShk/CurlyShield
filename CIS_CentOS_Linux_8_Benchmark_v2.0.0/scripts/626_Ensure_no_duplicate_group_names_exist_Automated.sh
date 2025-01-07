group_gids=$(getent group | awk '{print $3}' | sort -u | wc -l)
if [ $group_gids -ne $(getent group | awk '{print $3}' | sort -u | wc -l) ]; then
for gid in $(getent group | awk '{print $3}' | sort -u); do
new_gid=$((gid + 1))
echo "Changing GID of group with ID $gid to $new_gid"
groupmod -g $new_gid <(groupdel -g $gid)
done
fi