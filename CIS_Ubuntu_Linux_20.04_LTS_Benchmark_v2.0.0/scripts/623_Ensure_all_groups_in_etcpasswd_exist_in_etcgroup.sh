for group in $(grep -o "x:\([^,]*,\)" /etc/passwd | cut -d: -f2-); do
if ! grep -q "$group" /etc/group; then
echo "Group $group does not exist in /etc/group"
fi
done
for group in $(grep -o "x:\([^,]*,\)" /etc/passwd | cut -d: -f2-); do
if ! grep -q "$group" /etc/group; then
echo "Adding group $group to /etc/group"
groupadd $group > /dev/null
fi
done