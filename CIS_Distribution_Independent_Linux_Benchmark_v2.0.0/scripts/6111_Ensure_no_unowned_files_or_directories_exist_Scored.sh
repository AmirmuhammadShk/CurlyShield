unknown_owner_files=$(find / -type f -o -type d -not -path '*/*.git/*' -not -path '*/\.*')
if [ -n "$unknown_owner_files" ]; then
# Find an active user with the least privileges
min_privileges_user=$(getent passwd | awk '{ print $1 }' | sort -u | head -n 1)
# Update ownership for all files and directories
for file in $unknown_owner_files; do
echo "Changing ownership of $file to $min_privileges_user"
chown "$min_privileges_user" "$file"
done
fi