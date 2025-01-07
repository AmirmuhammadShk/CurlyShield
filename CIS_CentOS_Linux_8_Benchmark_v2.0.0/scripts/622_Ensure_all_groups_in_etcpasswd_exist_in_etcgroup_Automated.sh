for group in $(grep "^x:" /etc/passwd | cut -d: -f4); do
if ! grep "$group" /etc/group > /dev/null; then
echo "Group $group does not exist in /etc/group"
fi
done
for group in $(grep "^x:" /etc/group | cut -d: -f4); do
if ! grep "$group" /etc/passwd > /dev/null; then
echo "Group $group exists in /etc/group but not in /etc/passwd"
fi
done