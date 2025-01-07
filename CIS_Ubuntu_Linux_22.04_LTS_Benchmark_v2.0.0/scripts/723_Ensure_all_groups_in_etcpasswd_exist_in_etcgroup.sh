for user in $(cat /etc/passwd | cut -d: -f4); do
group=$(getent group "$user")
if [ -z "$group" ]; then
echo "Group $user does not exist in /etc/passwd"
fi
done
groups=$(getent group | cut -d: -f1)
for g in $groups; do
user=$(getent passwd | awk -F: 'user == "$g" {print $1}')
if [ -z "$user" ]; then
echo "Group $g does not exist in /etc/passwd"
fi
done