find_unowned_files() {
# Find unowned files
unowned_files=$(find / -type f -empty)
if [ -n "$unowned_files" ]; then
echo "Unowned files found:"
echo "$unowned_files"
# Remove or set ownership to an active user
for file in $unowned_files; do
read -p "Enter username to assign ownership to: " username
# Assign ownership to the provided user
chown $username $file
done
else
echo "No unowned files found."
fi
}
find_unowned_directories() {
# Find unowned directories
unowned_directories=$(find / -type d -empty)
if [ -n "$unowned_directories" ]; then
echo "Unowned directories found:"
echo "$unowned_directories"
# Remove or set ownership to an active user
for directory in $unowned_directories; do
read -p "Enter username to assign ownership to: " username
# Assign ownership to the provided user
chown $username $directory
done
else
echo "No unowned directories found."
fi
}
find_unowned_files
find_unowned_directories