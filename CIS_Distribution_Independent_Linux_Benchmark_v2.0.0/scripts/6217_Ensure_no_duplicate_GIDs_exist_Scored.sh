while IFS= read -r line; do
if grep -q "^:gid:::" <<< "$line"; then
echo "Duplicate GID detected"
fi
done < /etc/group | grep -v '^' > /tmp/duplicate_gids
find / -type f -exec test -G {} \; -print0 | sort -u | while IFS= read -r file; do
echo "File: $file"
done
grpck --quiet --check-group-ids