find /path/to/directory -type f -o -type d | while read file; do
if [ -z "$(id -u "$file")" ] || [ -z "$(id -g "$file")" ]; then
echo "Warning: File '$file' has no ownership and group"
# Ask for input to set ownership and group
read -p "Enter new owner: " owner
read -p "Enter new group: " group
# Set ownership and group
chown "$owner:$group" "$file"
fi
done