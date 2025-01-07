for user in $(getent passwd | awk -F: '$3 == "0" {print $1}'); do
if [ "$user" != "root" ]; then
usermod -u $(id -u "$user") "$user"
fi
done
getent passwd | awk -F: '$3 == "0" {print $1}' | grep -q 'root' || echo "Error: UID 0 not assigned to root"
echo "UID 0 assigned to root"
for user in $(getent passwd | awk -F: '$3 == "0" {print $1}'); do
if [ "$user" != "root" ]; then
usermod -g $(groups "$user") "$user"
fi
done