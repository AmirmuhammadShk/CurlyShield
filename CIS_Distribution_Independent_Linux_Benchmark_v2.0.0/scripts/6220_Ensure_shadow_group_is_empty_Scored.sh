for user in $(getent group shadow | cut -d: -f4); do
getent passwd $user | cut -d: -f7 | xargs deluser --quiet
done
for user in $(getent passwd | awk '$3 ~ /shadow/ {print $1}'); do
if [ "$user" != "$(whoami)" ]; then
getent group $user | cut -d: -f4 | xargs usermod --primary-group $(getent group $user | cut -d: -f4) --quiet
fi
done