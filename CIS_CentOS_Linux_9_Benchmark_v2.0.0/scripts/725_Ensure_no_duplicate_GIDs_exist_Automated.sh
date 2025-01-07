get_duplicate_gids() {
gids=$(getent group | awk '{print $1}')
for gid in $gids; do
if ! grep -q "^$gid:" /etc/group; then
echo "Duplicate GID found: $gid"
fi
done
}
getent group | awk '{print $1}' | while read gid; do
files=$(find / -type f -group $gid)
if [ -n "$files" ]; then
echo "Files belonging to GID $gid:"
for file in $files; do
echo "$file"
done
fi
done