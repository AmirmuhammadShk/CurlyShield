for user in $(grep -o "\b\w\+\b" /etc/shadow); do
if [ ! -n "$user" ]; then
echo "Locking account $user..."
passwd -l "$user"
fi
done
for user in $(ps aux | awk '{print $1}'); do
if [ "$(ps aux | grep -v "$user" | wc -l)" -eq 0 ]; then
echo "Forcing off account $user..."
userdel -f "$user"
fi
done