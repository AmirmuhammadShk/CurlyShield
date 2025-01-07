for group in $(getent group | cut -d: -f1); do
if ! grep "$group" /etc/group; then
echo "$group:" > /etc/group
chgrp -R "$group" /
fi
done