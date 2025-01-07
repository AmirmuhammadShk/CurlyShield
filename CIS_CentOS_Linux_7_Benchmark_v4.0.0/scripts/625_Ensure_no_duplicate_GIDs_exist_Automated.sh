audit_results=$(audit --gidlist=/etc/group)
unique_gids=($(echo "$audit_results" | grep -o '[0-9]\+'))
for gid in "${unique_gids[@]}"; do
if echo "/etc/group" | grep -q "^$gid:"; then
echo "Duplicate GID $gid found"
fi
done
for file in /path/to/files/owned/by/shared/gids; do
file_gid=$(stat -c '%g' "$file")
for gid in "${unique_gids[@]}"; do
if [ $gid -eq $file_gid ]; then
echo "File $file belongs to GID $gid"
break
fi
done
done