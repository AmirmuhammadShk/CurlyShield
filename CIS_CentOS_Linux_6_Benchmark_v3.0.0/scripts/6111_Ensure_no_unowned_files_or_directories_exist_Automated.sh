unowned_files=$(find / -users @ -printf '%p\n')
while IFS= read -r file; do
if [ ! -d "$file" ]; then
owner=$(getent passwd | cut -d: -f1)
user=$(id -un | tr '\n' ' ')
chown $owner:$user "$file"
fi
done <<< "$unowned_files"
if [ -z "$unowned_files" ]; then
echo "No unowned files or directories found."
else
echo "Unowned files or directories found. Ownership reset in progress..."
fi