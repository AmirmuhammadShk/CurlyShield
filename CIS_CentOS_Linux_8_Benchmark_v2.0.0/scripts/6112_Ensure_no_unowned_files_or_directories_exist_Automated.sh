find_files() {
for file in $(ls -A -- */); do
owner=$(stat -c "%u" "$file")
group=$(stat -c "%g" "$file")
if ! grep -q "^$owner:$group" /etc/passwd && ! grep -q "^$group:" /etc/group; then
echo "File: $file, Owner: $owner, Group: $group"
fi
done
}
reset_ownership() {
while read -r file owner group; do
sudo chown "$owner:$group" "$file" || echo "Error resetting ownership of $file to $owner:$group"
done < <(find_files)
}
echo "Running the script..."
reset_ownership
echo "Script finished running."